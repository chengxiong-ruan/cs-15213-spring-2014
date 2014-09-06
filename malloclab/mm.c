/*
 * mm.c
 * cruan - Chengxiong Ruan
 * 
 * method :
 * (1) use several list to store small size free block, e.g. block with size 8, 16, 24, 32, 40 ....
 * there is a size threshold to determine wheter a free block is sotre in these small block list or not.
 * When larger than this threshold, a free block is stored in a binary tree, with each node stores a
 * free list and each list store free block of same size.
 * (2) use best fit to find a free block
 * (3) split a block when placed
 * (4) coalesce immediately when free and extend heap
 * 
 * block structure :
 *
 * (1) small free block
 * [header, 4-bytes, <size><pre alloc bit><alloc bit>]   // size:size of block, pre alloc bit:indicate previouds block's status, alloc bit:status
 * [uint address to next block in list, 4-bytes]
 * [uint address to previous block in list, 4-bytes]
 * [ ...
 *   payload
 *   ... ]
 * [footer, 4-bytes, same to header]
 *
 * (2) large free block
 * [header, 4-bytes, <size><pre alloc bit><alloc bit>]  // same as small free block
 * [uint address to next block in list, 4-bytes]
 * [uint address to previous block in list, 4-bytes]
 * [ptr to left child node]     <----------------------|
 * [ptr to right child node]    <----------------------| 
 * [ptr to parent's pointer which point to this block]-| (point to parent's one of these two elements, decided by whether it's left or right child)
 * [ ...
 *   payload
 *   ... ]
 * [footer, 4-bytes, same to header]
 *
 * (3) alloced block
 * [header, 4-bytes, <size><pre alloc bit><alloc bit>]
 * [ ...
 *   payload
 *   ... ]
 */

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include "contracts.h"

#include "mm.h"
#include "memlib.h"


// Create aliases for driver tests
// DO NOT CHANGE THE FOLLOWING!
#ifdef DRIVER
#define malloc mm_malloc
#define free mm_free
#define realloc mm_realloc
#define calloc mm_calloc
#endif

#ifndef NDEBUG
#define dbg_printf(...) printf(__VA_ARGS__)
#define checkheap(verbose) do {if (mm_checkheap(verbose)) {  \
                             printf("Checkheap failed on line %d\n", __LINE__);\
                             exit(-1);  \
                        }}while(0)
#else
#define dbg_printf(...)
#define checkheap(...)
#endif

/***********************************

***********************************/

static char* heap_listp = NULL;         // head of heap
static void* tree_root = NULL;          // root of tree
static unsigned int* small_list_array;              // array of free list of small block

/* allocator manipulation functions */
static void place(void* bp, size_t asize);
static void** binary_search_best_fit(void** node, size_t size);
static void* best_fit(size_t asize);
static void* coalesce(void* bp);
static void* extend_heap(size_t words);

/* Macros.... */
#define SMALL_LIST_SIZE 5
#define ALIGN(size) (((size) + (8 - 1)) & ~0x7)     // align to multiple of 8

#define WSIZE       4           // word size
#define DSIZE       8           // double word size
#define CHUNKSIZE   64    // exten heap by this size
#define LARGE_BLOCK_THRES 40    // large block size threshold

#define PACK(size, alloc)   ((size) | (alloc))      // pack a size an alloc bit
#define GET(p)              (*(unsigned int *)(p))  // read a word from p
#define GET_SIZE(p)         (GET(p) & ~0x7)         // get size of block from p

#define HDRP(bp)            ((char*)(bp) - WSIZE)                       // get pointer to header
#define FTRP(bp)            ((char*)(bp) + GET_SIZE(HDRP(bp)) - DSIZE)  // get pointer to footer

#define NEXT_BLKP(bp)       ((char*)(bp) + GET_SIZE(((char*)(bp) - WSIZE))) // get pointer to next block
#define PREV_BLKP(bp)       ((char*)(bp) - GET_SIZE(((char*)(bp) - DSIZE))) // get pointer to previous block

#define NEXT_BLK_IN_LIST(bp)    (*(unsigned int*)(bp))                  // get pointer to next block in free list
#define PREV_BLK_IN_LIST(bp)    (*(unsigned int*)((char*)(bp) + WSIZE)) // get pointer to previous block in free list

#define LFET_CHILD_NODE_PT(bp) (*get_left_child_ptpt(bp))   // get pointer to left child node
#define RIGHT_CHILD_NODE_PT(bp) (*get_right_child_ptpt(bp)) // get pointer to right child node
#define PT_TO_PARENT_CHILD_PT(bp) (*(void***)((char*)(bp) + DSIZE * 3)) // get pointer to 8-bytes in parent block, which is the pointer to child itsefl

/*                   */
/*  Helper functions */
/*                   */

// Align p to a multiple of w bytes
static inline void* align(const void const* p, unsigned char w) {
    return (void*)(((uintptr_t)(p) + (w-1)) & ~(w-1));
}

// Check if the given pointer is 8-byte aligned
static inline int aligned(const void const* p) {
    return align(p, 8) == p;
}

// Return whether the pointer is in the heap.
static inline int in_heap(const void* p) {
    return p <= mem_heap_hi() && p >= mem_heap_lo();
}

/*                                  */
/*  My Block Manipulations          */
/* main purpose: add blocks to free */
/* lists or remove them from lists  */
/*                                  */

// set alloc for current block in next block
static void set_alloc_in_next_blk(void* bp) {
    REQUIRES(bp != NULL);
    REQUIRES(in_heap(bp));
    (GET(HDRP(NEXT_BLKP(bp))) |= 0x2);
}

// set unalloc for current block in next block
static void set_unalloc_in_next_blk(void* bp) {
    REQUIRES(bp != NULL);
    REQUIRES(in_heap(bp));
    (GET(HDRP(NEXT_BLKP(bp))) &= ~0x2);
}

// is previous block in heap alloced?
static unsigned int be_pre_alloc(void* bp) {
    REQUIRES(bp != NULL);
    REQUIRES(in_heap(bp));
    return GET(HDRP(bp)) & 0x2;
}

// is current block in heap alloced?
static unsigned int be_alloc(void* bp) {
    REQUIRES(bp != NULL);
    REQUIRES(in_heap(bp));
    return GET(HDRP(bp)) & 0x1;
}

// Convert 32-bit unsigned int to 64-bit address
static void* uint2ptr(unsigned int w) {
    return ((w) == 0 ? NULL : (void*)((unsigned int)(w) + (uintptr_t)(heap_listp)));
}

// Convert 64-bit address to 32-bit unsigned int
static unsigned int ptr2uint(void* p)
{
    return ((p) == NULL ? 0 : (unsigned int)((uintptr_t)(p) - (uintptr_t)(heap_listp)));
}

// write to a word, without changing the bit indicating previous block allacation status
static void put_keep_pre_alloc(void* p, unsigned int val) {
    REQUIRES(p != NULL);
    REQUIRES(in_heap(p));
    GET(p) = (GET(p) & 0x2) | (val);
}

// get pointer to the pointer to left child node
static void** get_left_child_ptpt(void* bp) {
    REQUIRES(bp != NULL);
    REQUIRES(in_heap(bp));
    return (void**)((char*)(bp) + DSIZE);
}

// get pointer to the pointer to right child node
static void** get_right_child_ptpt(void* bp) {
    REQUIRES(bp != NULL);
    REQUIRES(in_heap(bp));
    return (void**)((char*)(bp) + 2*DSIZE);
}

// remove block from free list, and adjust the link
static void update_list_link(void* bp) {
    REQUIRES(bp != NULL);
    REQUIRES(in_heap(bp));
    // if bp has a next block in list, let next's pre block be bp's pre block
    if (NEXT_BLK_IN_LIST(bp)) {
        PREV_BLK_IN_LIST(uint2ptr(NEXT_BLK_IN_LIST(bp))) = PREV_BLK_IN_LIST(bp);
    }

    // if bp has a pre block in list, let pre's next block be bp's next block
    if (PREV_BLK_IN_LIST(bp)) {
        NEXT_BLK_IN_LIST(uint2ptr(PREV_BLK_IN_LIST(bp))) = NEXT_BLK_IN_LIST(bp);
    }
    // so the link between bp and it's pre and next is removed now
}

// inital a block's link with other blocks
static void reset_block(void* bp) {
    REQUIRES(bp != NULL);
    REQUIRES(in_heap(bp));
    // if blocks in tree, set its tree attributes to null
    if (GET_SIZE(HDRP(bp)) > LARGE_BLOCK_THRES) {
        LFET_CHILD_NODE_PT(bp) = NULL;
        RIGHT_CHILD_NODE_PT(bp) = NULL;
        PT_TO_PARENT_CHILD_PT(bp) = NULL;
    }

    // reset links in free list
    NEXT_BLK_IN_LIST(bp) = 0;
    PREV_BLK_IN_LIST(bp) = 0;
}

// remove free blcok in tree when the block has a next block in list
static void rmv_blk_fr_ls_with_next(void* bp, void* left_child, void* right_child) {
    REQUIRES(bp != NULL);
    REQUIRES(in_heap(bp));

    void* candidate_blk;
    candidate_blk = uint2ptr(NEXT_BLK_IN_LIST(bp));

    // update pointers in both child and parent
    PT_TO_PARENT_CHILD_PT(candidate_blk) = PT_TO_PARENT_CHILD_PT(bp);
    *PT_TO_PARENT_CHILD_PT(candidate_blk) = candidate_blk;

    // update bp's child's parent node
    LFET_CHILD_NODE_PT(candidate_blk) = left_child;
    if (left_child) {
        PT_TO_PARENT_CHILD_PT(left_child) = get_left_child_ptpt(candidate_blk);
    }
        
    RIGHT_CHILD_NODE_PT(candidate_blk) = right_child;
    if (right_child) {
        PT_TO_PARENT_CHILD_PT(right_child) = get_right_child_ptpt(candidate_blk);
    }
}

// remove block from tree when it has no next block in list, but has both left and right child
static void rmv_blk_fr_ls_with_lr(void* bp, void* left_child, void* right_child) {
    REQUIRES(bp != NULL);
    REQUIRES(in_heap(bp));

    if (!RIGHT_CHILD_NODE_PT(left_child)) {
        // if the left_child hase no right child
        // let it be the node
        RIGHT_CHILD_NODE_PT(left_child) = right_child;
        PT_TO_PARENT_CHILD_PT(left_child) = PT_TO_PARENT_CHILD_PT(bp);
        *PT_TO_PARENT_CHILD_PT(left_child) = left_child;
        PT_TO_PARENT_CHILD_PT(right_child) = get_right_child_ptpt(left_child);
    } else {
        void* candidate_blk;
        // candidate_blk will be the rigth most node in left
        candidate_blk = RIGHT_CHILD_NODE_PT(left_child);
        while (RIGHT_CHILD_NODE_PT(candidate_blk)) {
            candidate_blk = RIGHT_CHILD_NODE_PT(candidate_blk);
        }
        
        // if candidate_blk hase a left child, let it replace candidate
        if (LFET_CHILD_NODE_PT(candidate_blk)) {
            PT_TO_PARENT_CHILD_PT(LFET_CHILD_NODE_PT(candidate_blk)) = PT_TO_PARENT_CHILD_PT(candidate_blk);
        }

        // let candidate be the node
        *PT_TO_PARENT_CHILD_PT(candidate_blk) = LFET_CHILD_NODE_PT(candidate_blk);
        
        PT_TO_PARENT_CHILD_PT(candidate_blk) = PT_TO_PARENT_CHILD_PT(bp);
        *PT_TO_PARENT_CHILD_PT(candidate_blk) = candidate_blk;

        LFET_CHILD_NODE_PT(candidate_blk) = left_child;
        RIGHT_CHILD_NODE_PT(candidate_blk) = right_child;
        PT_TO_PARENT_CHILD_PT(left_child) = get_left_child_ptpt(candidate_blk);
        PT_TO_PARENT_CHILD_PT(right_child) = get_right_child_ptpt(candidate_blk);
    }
}

// remove free block from tree when block has only left child
// almost the same with function "rmv_blk_fr_ls_with_lr"
static void rmv_blk_fr_ls_with_l(void* bp, void* left_child, void* right_child) {
    REQUIRES(bp != NULL);
    REQUIRES(in_heap(bp));

    if (!RIGHT_CHILD_NODE_PT(left_child)) {
        RIGHT_CHILD_NODE_PT(left_child) = right_child;
        PT_TO_PARENT_CHILD_PT(left_child) = PT_TO_PARENT_CHILD_PT(bp);
        *PT_TO_PARENT_CHILD_PT(left_child) = left_child;
    } else {
        void* candidate_blk;
        candidate_blk = RIGHT_CHILD_NODE_PT(left_child);
        while (RIGHT_CHILD_NODE_PT(candidate_blk)) {
            candidate_blk = RIGHT_CHILD_NODE_PT(candidate_blk);
        }
        
        if (LFET_CHILD_NODE_PT(candidate_blk)) {
            PT_TO_PARENT_CHILD_PT(LFET_CHILD_NODE_PT(candidate_blk)) = PT_TO_PARENT_CHILD_PT(candidate_blk);
        }

        *PT_TO_PARENT_CHILD_PT(candidate_blk) = LFET_CHILD_NODE_PT(candidate_blk);
        PT_TO_PARENT_CHILD_PT(candidate_blk) = PT_TO_PARENT_CHILD_PT(bp);
        *PT_TO_PARENT_CHILD_PT(candidate_blk) = candidate_blk;
        LFET_CHILD_NODE_PT(candidate_blk) = left_child;
        RIGHT_CHILD_NODE_PT(candidate_blk) = right_child;
        PT_TO_PARENT_CHILD_PT(left_child) = get_left_child_ptpt(candidate_blk);
    }
}

// remove free block from tree when block has only right child
// almost the same with function "rmv_blk_fr_ls_with_lr"
static void rmv_blk_fr_ls_with_r(void* bp, void* left_child, void* right_child) {
    REQUIRES(bp != NULL);
    REQUIRES(in_heap(bp));

    if (!LFET_CHILD_NODE_PT(right_child)) {
        LFET_CHILD_NODE_PT(right_child) = left_child;
        PT_TO_PARENT_CHILD_PT(right_child) = PT_TO_PARENT_CHILD_PT(bp);
        *PT_TO_PARENT_CHILD_PT(right_child) = right_child;
    } else {
        void* candidate_blk;
        candidate_blk = LFET_CHILD_NODE_PT(right_child);
        while (LFET_CHILD_NODE_PT(candidate_blk)) {
            candidate_blk = LFET_CHILD_NODE_PT(candidate_blk);
        }

        if (RIGHT_CHILD_NODE_PT(candidate_blk)) {
            PT_TO_PARENT_CHILD_PT(RIGHT_CHILD_NODE_PT(candidate_blk)) = PT_TO_PARENT_CHILD_PT(candidate_blk);
        }

        *PT_TO_PARENT_CHILD_PT(candidate_blk) = RIGHT_CHILD_NODE_PT(candidate_blk);
        PT_TO_PARENT_CHILD_PT(candidate_blk) = PT_TO_PARENT_CHILD_PT(bp);
        *PT_TO_PARENT_CHILD_PT(candidate_blk) = candidate_blk;
        LFET_CHILD_NODE_PT(candidate_blk) = left_child;
        RIGHT_CHILD_NODE_PT(candidate_blk) = right_child;
        PT_TO_PARENT_CHILD_PT(right_child) = get_right_child_ptpt(candidate_blk);
    }
}

// remove free block from binary tree
static void remove_block_from_list_in_tree(void* bp) {
    REQUIRES(bp != NULL);
    REQUIRES(in_heap(bp));

    void* left_child = LFET_CHILD_NODE_PT(bp);
    void* right_child = RIGHT_CHILD_NODE_PT(bp);

    if (uint2ptr(NEXT_BLK_IN_LIST(bp))) {
        // if bp has a next block in list
        // just let next block be the node
        rmv_blk_fr_ls_with_next(bp, left_child, right_child);
    } else if (left_child && right_child) {
        // if thre is no other blocks in list
        // but, if there are both left and right child
        // make thr right most node in left be the node
        rmv_blk_fr_ls_with_lr(bp, left_child, right_child);
    } else if (left_child) {
        // if there is only a left_child
        // make the right most in left be the node
        rmv_blk_fr_ls_with_l(bp, left_child, right_child);
    } else if (right_child) {
        // if there is only right child
        // let left most node in right be the node
        rmv_blk_fr_ls_with_r(bp, left_child, right_child);
    } else {
        *PT_TO_PARENT_CHILD_PT(bp) = NULL;
    }
}

// remove a free block from tree
static void remove_block_from_list(void* bp) {
    REQUIRES(bp != NULL);
    REQUIRES(in_heap(bp));

    if (GET_SIZE(HDRP(bp)) <= LARGE_BLOCK_THRES || !PT_TO_PARENT_CHILD_PT(bp)) {
        if (!PREV_BLK_IN_LIST(bp)) {
            small_list_array[GET_SIZE(HDRP(bp)) / DSIZE - 1] = NEXT_BLK_IN_LIST(bp);
        }
    } else {
        remove_block_from_list_in_tree(bp);
    }
    update_list_link(bp);
}

// add free block to bianry tree
static void add_free_block_to_tree(void* bp, size_t block_size) {
    REQUIRES(bp != NULL);
    REQUIRES(in_heap(bp));
    REQUIRES(block_size > 2*DSIZE);

    void* tmp_parent = NULL;
    void** target_pos = &tree_root;
    size_t cur_size;
    while (*target_pos) {
        tmp_parent = *target_pos;
        cur_size = GET_SIZE(HDRP(tmp_parent));

        // if block_size equal to the current node, add it to the list
        if (block_size == cur_size) {
            if (NEXT_BLK_IN_LIST(tmp_parent)) {
                PREV_BLK_IN_LIST(uint2ptr(NEXT_BLK_IN_LIST(tmp_parent))) = ptr2uint(bp);
            }
            NEXT_BLK_IN_LIST(bp) = NEXT_BLK_IN_LIST(tmp_parent);
            PREV_BLK_IN_LIST(bp) = ptr2uint(tmp_parent);
            NEXT_BLK_IN_LIST(tmp_parent) = ptr2uint(bp);
            return;
        }
        // choose a correct direction (left or right?)
        if (block_size < cur_size) {
            target_pos = get_left_child_ptpt(tmp_parent);
        } else if (block_size > cur_size) {
            target_pos = get_right_child_ptpt(tmp_parent);
        }
    }

    *target_pos = bp;
    PT_TO_PARENT_CHILD_PT(*target_pos) = target_pos;
}

// add free block to free lists (small size free block list or binary tree)
static void add_free_block(void* bp) {
    REQUIRES(bp != NULL);
    REQUIRES(in_heap(bp));
    size_t block_size = GET_SIZE(HDRP(bp));

    // reset block before adding it to free lists
    reset_block(bp);
    
    // add the free block to small size list
    if (block_size <= LARGE_BLOCK_THRES) {
        // insert into small free list
        int index = block_size / DSIZE - 1;

        // if the list is not empty, add the block into list
        if (small_list_array[index]) {
            NEXT_BLK_IN_LIST(bp) = small_list_array[index];
            PREV_BLK_IN_LIST(uint2ptr(small_list_array[index])) = ptr2uint(bp);
        }

        // make bp the root of the list
        PREV_BLK_IN_LIST(bp) = 0;
        small_list_array[index] = ptr2uint(bp);
        return;
    }

    // find a leaf node in tree to add the block
    add_free_block_to_tree(bp, block_size);
}

/*                                   */
/*  allocator manipulation functions */
/*                                   */

// initialization
int mm_init(void) {
    /* Create the initial empty heap */
    if ((small_list_array = mem_sbrk(ALIGN(SMALL_LIST_SIZE * WSIZE) + 4 * WSIZE)) == (void*)-1) {
        return -1;
    }
    
    // SMALL_LIST_SIZE words to store small size block free list array
    memset(small_list_array, 0, SMALL_LIST_SIZE * WSIZE);
    heap_listp = (void*)ALIGN((unsigned long)(small_list_array + SMALL_LIST_SIZE));
    tree_root = NULL;

    // prologue and epilogue
    *(unsigned int *)(heap_listp) = 0;
    *(unsigned int *)(heap_listp + (1 * WSIZE)) = PACK(DSIZE, 1);
    *(unsigned int *)(heap_listp + (2 * WSIZE)) = PACK(DSIZE, 1);
    *(unsigned int *)(heap_listp + (3 * WSIZE)) = PACK(0, 1);
    heap_listp += (2 * WSIZE);
    set_alloc_in_next_blk(heap_listp);

    return 0;
}

// malloc
void* malloc(size_t size) {
    size_t size_aligned;
    size_t size_extend;
    char* bp;

    if (size == 0) {
        return NULL;
    }

    // align size to double words
    if (size <= DSIZE) {
        size_aligned = 2 * DSIZE;
    } else {
        size_aligned = DSIZE * ((size + (WSIZE) + (DSIZE - 1)) / DSIZE);
    }

    // find a best fit for request
    if ((bp = best_fit(size_aligned)) != NULL) {
        place(bp, size_aligned);
        return bp;
    }

    // No fit found. Get more memory and place the block
    size_extend = (size_aligned > CHUNKSIZE) ? size_aligned : CHUNKSIZE;
    if ((bp = extend_heap(size_extend / WSIZE)) == NULL) {
        return NULL;
    }

    place(bp, size_aligned);
    return bp;
}

// free
void free(void* ptr) {
    if (!ptr)
        return;

    size_t size = GET_SIZE(HDRP(ptr));
    put_keep_pre_alloc(HDRP(ptr), PACK(size, 0));
    put_keep_pre_alloc(FTRP(ptr), PACK(size, 0));
    set_unalloc_in_next_blk(ptr);

    reset_block(ptr);
    add_free_block(coalesce(ptr));
}

// realloc
void* realloc(void* oldptr, size_t size) {
    size_t oldsize;
    void* newptr;

    // if size is zero, free the block
    if (size == 0) {
        free(oldptr);
        return NULL;
    }

    // If oldptr is NULL, 
    if (oldptr == NULL) {
        return malloc(size);
    }

    newptr = malloc(size);

    // failed
    if (!newptr) {
        return NULL;
    }

    // copy data to new block
    oldsize = GET_SIZE(HDRP(oldptr));
    if (size < oldsize) {
        oldsize = size;
    }
    memcpy(newptr, oldptr, oldsize);

    // free old block
    free(oldptr);

    return newptr;
}

// calloc ....
void* calloc(size_t nmemb, size_t size)
{
    size_t bytes = nmemb * size;
    void* newptr;

    newptr = malloc(bytes);
    memset(newptr, 0, bytes);

    return newptr;
}

// extend heap with free block and return its block pointer
static void* extend_heap(size_t words) {
    char *bp;
    size_t size;

    // aligned to double-word size
    size = (words % 2) ? (words + 1) * WSIZE : words * WSIZE;
    if ((long)(bp = mem_sbrk(size)) == -1) {
        return NULL;
    }

    put_keep_pre_alloc(HDRP(bp), PACK(size, 0));           // Free block header
    put_keep_pre_alloc(FTRP(bp), PACK(size, 0));           // Free block footer
    reset_block(bp);
    put_keep_pre_alloc(HDRP(NEXT_BLKP(bp)), PACK(0, 1));   // New epilogue header

    // Coalesce if the previous block was free
    bp = coalesce(bp);
    return bp;
}

// find a block best fit the request
static void* best_fit(size_t aligned_size) {
    void* bp;
    void** free_list_root;
    
    // find a hit in small block list array
    // if I search the whole array, util would drop down, but it seems to be a better best fit
    if (aligned_size <= LARGE_BLOCK_THRES) {
        int index = aligned_size / DSIZE - 1;
        if (small_list_array[index]) {
            bp = uint2ptr(small_list_array[index]);
            small_list_array[index] = NEXT_BLK_IN_LIST(bp);
            remove_block_from_list(bp);
            return bp;
        }
    }

    // search a best fit in binary tree
    free_list_root = binary_search_best_fit(&tree_root, aligned_size);

    // no best fit in tree
    if (free_list_root == NULL) {
        return NULL;
    }

    bp = *free_list_root;

    // update list's root to next block in lise
    *free_list_root = uint2ptr(NEXT_BLK_IN_LIST(bp));

    remove_block_from_list(bp);
    return bp;
}

// search a best fit in binary tree
static void** binary_search_best_fit(void** root, size_t size) {
    void** candidate;
    void* parent = *root;
    size_t cur_size;

    if (parent == NULL)
        return NULL;

    cur_size = GET_SIZE(HDRP(parent));

    if (size ==  cur_size) {
        return root;
    }

    if (size < cur_size) {
        // search left branch
        candidate = binary_search_best_fit(get_left_child_ptpt(parent), size);
        return candidate ? candidate : root;
    } else {
        // search right branch
        return binary_search_best_fit(get_right_child_ptpt(parent), size);
    }
}

// allocate aligned_size block, and split it if the remainder is large enough
static void place(void* bp, size_t aligned_size) {
    REQUIRES(bp != NULL);
    REQUIRES(in_heap(bp));
    REQUIRES(aligned_size > 2*DSIZE);

    size_t total_size = GET_SIZE(HDRP(bp));
    size_t remain_size = total_size - aligned_size;

    if (remain_size >= (2 * DSIZE)) {
        // almost same to the textbook, but remember the pre-alloc bit
        put_keep_pre_alloc(HDRP(bp), PACK(aligned_size, 1));
        put_keep_pre_alloc(FTRP(bp), PACK(aligned_size, 1));
        set_alloc_in_next_blk(bp);
        bp = NEXT_BLKP(bp);
        put_keep_pre_alloc(HDRP(bp), PACK(remain_size, 0));
        put_keep_pre_alloc(FTRP(bp), PACK(remain_size, 0));
        set_unalloc_in_next_blk(bp);
        add_free_block(bp);
    } else {
        put_keep_pre_alloc(HDRP(bp), PACK(total_size, 1));
        put_keep_pre_alloc(FTRP(bp), PACK(total_size, 1));
        set_alloc_in_next_blk(bp);
    }
}

// coalesce free blocks, remove them from list and add new one into lise
static void* coalesce(void* bp) {
    void* prev_block;
    void* next_block;

    unsigned int prev_alloc = be_pre_alloc(bp);
    unsigned int next_alloc = be_alloc(NEXT_BLKP(bp));
    size_t size = GET_SIZE(HDRP(bp));

    // there are 4 cases same as textbook

    if (prev_alloc && next_alloc) {             // Case 1 : previous and next block in heap are alloced
        return bp;
    } else if (prev_alloc && !next_alloc) {     // Case 2 : previous is alloced
        next_block = NEXT_BLKP(bp);
        remove_block_from_list(next_block);
        size += GET_SIZE(HDRP(next_block));
        put_keep_pre_alloc(HDRP(bp), PACK(size, 0));
        put_keep_pre_alloc(FTRP(bp), PACK(size, 0));
    } else if (!prev_alloc && next_alloc) {     // Case 3 : next is alloced
        prev_block = PREV_BLKP(bp);
        remove_block_from_list(prev_block);
        size += GET_SIZE(HDRP(prev_block));
        put_keep_pre_alloc(FTRP(bp), PACK(size, 0));
        put_keep_pre_alloc(HDRP(prev_block), PACK(size, 0));
        bp = prev_block;
    } else {                                    // Case 4 : no alloced
        prev_block = PREV_BLKP(bp);
        next_block = NEXT_BLKP(bp);
        remove_block_from_list(next_block);
        remove_block_from_list(prev_block);
        size += GET_SIZE(HDRP(prev_block)) + GET_SIZE(HDRP(next_block));
        put_keep_pre_alloc(HDRP(prev_block), PACK(size, 0));
        put_keep_pre_alloc(FTRP(next_block), PACK(size, 0));
        bp = prev_block;
    }
    return bp;
}

/******************
    check heap
*******************/

// check block's correctness
int check_block(void* bp) {
    // check if bp is aligned
    if (!aligned(bp)) {
        printf("block not aligned");
        return 0;
    }
    // check if size in header and footer agree
    if ( !be_alloc(bp) && (GET_SIZE(HDRP(bp)) != GET_SIZE(FTRP(bp)))) {
        printf("header's size does not match footer\n");
        return 0;
    }
    // check if alloc bit in header and footer agree
    if ( !be_alloc(bp) && ((GET(HDRP(bp))&0x1) != (GET(FTRP(bp))&0x1))) {
        printf("header's alloc bit does not match footer\n");
        return 0;
    }
    // check if alloc bit agree next block's pre alloc bit
    if ( !be_alloc(bp) != !be_pre_alloc(NEXT_BLKP(bp))) {
        printf("alloc bit does not match between bp and its next block in heap\n");
        return 0;
    }
    // check adjacent free block
    if ( !be_alloc(bp) && !be_alloc(NEXT_BLKP(bp))) {
        printf("two adjacent blocks are both freed... not coalesced\n");
    }

    return 1;
}

// check a list
int check_free_list(void* root) {
    void* bp;

    if (root == NULL) {
        return 1;
    }

    bp = uint2ptr(NEXT_BLK_IN_LIST(root));
    while (ptr2uint(bp)) {
        if (!in_heap(bp)) {
            printf("block address not in heap, address : %p\n", bp);
            return 0;
        }
        // check next block's pre block in list agree this block
        if ( ptr2uint(bp) != PREV_BLK_IN_LIST(uint2ptr(NEXT_BLK_IN_LIST(bp))) ) {
            printf("error in list, next block's previous block not himself\n");
            return 0;
        }
        bp = uint2ptr(NEXT_BLK_IN_LIST(bp));
    }

    return 1;
}

// check a tree
int check_binary_tree(void* root) {
    if (root == NULL) {
        return 1;
    }

    // check left branch
    if (!check_binary_tree(LFET_CHILD_NODE_PT(root))) {
        printf("error in list of tree, node address : %p\n", LFET_CHILD_NODE_PT(root));
        return 0;
    }

    // check right branch
    if (!check_binary_tree(RIGHT_CHILD_NODE_PT(root))) {
        printf("error in list of tree, node address : %p\n", RIGHT_CHILD_NODE_PT(root));
        return 0;
    }

    return check_free_list(root);
}

// check heap
int mm_checkheap(int verbose) {
    // check prologue
    if (verbose) {
        printf("checking prologue\n");
    }
    REQUIRES(GET(heap_listp - WSIZE) == 0x9);
    REQUIRES(GET(heap_listp) == 0x9);


    // check each block
    if (verbose) {
        printf("checking blocks\n");
    }
    void* bp;
    for (bp = NEXT_BLKP(heap_listp); GET_SIZE(HDRP(bp)) > 0; bp = NEXT_BLKP(bp)) {
        if (verbose) {
            printf("checking block at address : %p\n", bp);
        }
        REQUIRES(check_block(bp));
    }

    // check small size list
    if (verbose) {
        printf("checking small size list array\n");
    }
    int i;
    for (i = 0; i < SMALL_LIST_SIZE; i++) {
        if (verbose) {
            printf("checking small list number %d\n", i);
        }
        REQUIRES(check_free_list(uint2ptr(small_list_array[i])));
    }

    // check large size list in tree
    if (verbose) {
        printf("checking large size free list tree\n");
    }
    REQUIRES(check_binary_tree(tree_root));

    // check epilogue
    if (verbose) {
        printf("checking epilogue\n");
    }
    REQUIRES(GET_SIZE(HDRP(bp)) == 0);
    REQUIRES(be_alloc(bp));
    return 0;
}
