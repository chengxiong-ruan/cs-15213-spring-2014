/* 
 * Author: Chengxiong Ruan
 * LoginID: cruan
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */ 
#include <stdio.h>
#include "cachelab.h"
#include "contracts.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/* 
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded. The REQUIRES and ENSURES from 15-122 are included
 *     for your convenience. They can be removed if you like.
 */
char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{

    int i, j, k, l, buf_to_B_0, buf_to_B_1, buf_to_B_2, buf_to_B_3, buf_to_B_4, buf_to_B_5, buf_to_B_6, buf_to_B_7;

    // if size 32x32, use 8x8 block to avoid too much conflict
    if (32 == M)
    {
        for (i = 0; i < 32; i = i + 8)
        {
            for (j = 0; j < 32; j = j + 8)
            {
                for (k = i; k < i + 8; k++)
                {
                    buf_to_B_0 = A[k][j];
                    buf_to_B_1 = A[k][j+1];
                    buf_to_B_2 = A[k][j+2];
                    buf_to_B_3 = A[k][j+3];
                    buf_to_B_4 = A[k][j+4];
                    buf_to_B_5 = A[k][j+5];
                    buf_to_B_6 = A[k][j+6];
                    buf_to_B_7 = A[k][j+7];
                    B[j][k] = buf_to_B_0;
                    B[j+1][k] = buf_to_B_1;
                    B[j+2][k] = buf_to_B_2;
                    B[j+3][k] = buf_to_B_3;
                    B[j+4][k] = buf_to_B_4;
                    B[j+5][k] = buf_to_B_5;
                    B[j+6][k] = buf_to_B_6;
                    B[j+7][k] = buf_to_B_7;
                }
            }
        }
    }
    // if size 64x64, use 4x4 blocks in a 8x8 super block 
    // and use 4x4 block in B as buffer since we should not use too much local variables
    else if (64 == M)
    { 
        for (i = 0; i < 64; i = i + 8)
        {
            for (j = 0; j < 64; j = j + 8)
            {
                // diagnal and not the lase one, use the 4x8 block adjacent to the right as buffer
                if (i == j && i != 56)
                {
                    l = 0;
                    for (k = i; k < i + 4; k++)
                    {
                        buf_to_B_0 = A[k][j];
                        buf_to_B_1 = A[k][j+1];
                        buf_to_B_2 = A[k][j+2];
                        buf_to_B_3 = A[k][j+3];
                        buf_to_B_4 = A[k][j+4];
                        buf_to_B_5 = A[k][j+5];
                        buf_to_B_6 = A[k][j+6];
                        buf_to_B_7 = A[k][j+7];
                        B[i][j+8+l] = buf_to_B_0;
                        B[i+1][j+8+l] = buf_to_B_1;
                        B[i+2][j+8+l] = buf_to_B_2;
                        B[i+3][j+8+l] = buf_to_B_3;
                        B[i][j+12+l] = buf_to_B_4;
                        B[i+1][j+12+l] = buf_to_B_5;
                        B[i+2][j+12+l] = buf_to_B_6;
                        B[i+3][j+12+l] = buf_to_B_7;
                        l ++;
                    }
                    for (k = i; k < i + 4; k++)
                    {
                        buf_to_B_0 = B[k][j+8];
                        buf_to_B_1 = B[k][j+9];
                        buf_to_B_2 = B[k][j+10];
                        buf_to_B_3 = B[k][j+11];
                        buf_to_B_4 = B[k][j+12];
                        buf_to_B_5 = B[k][j+13];
                        buf_to_B_6 = B[k][j+14];
                        buf_to_B_7 = B[k][j+15];
                        B[k][j] = buf_to_B_0;
                        B[k][j+1] = buf_to_B_1;
                        B[k][j+2] = buf_to_B_2;
                        B[k][j+3] = buf_to_B_3;
                        B[k+4][j] = buf_to_B_4;
                        B[k+4][j+1] = buf_to_B_5;
                        B[k+4][j+2] = buf_to_B_6;
                        B[k+4][j+3] = buf_to_B_7;
                    }
                    
                    l = 0;
                    for (k = i + 4; k < i + 8; k++)
                    {
                        buf_to_B_0 = A[k][j];
                        buf_to_B_1 = A[k][j+1];
                        buf_to_B_2 = A[k][j+2];
                        buf_to_B_3 = A[k][j+3];
                        buf_to_B_4 = A[k][j+4];
                        buf_to_B_5 = A[k][j+5];
                        buf_to_B_6 = A[k][j+6];
                        buf_to_B_7 = A[k][j+7];
                        B[i][j+8+l] = buf_to_B_0;
                        B[i+1][j+8+l] = buf_to_B_1;
                        B[i+2][j+8+l] = buf_to_B_2;
                        B[i+3][j+8+l] = buf_to_B_3;
                        B[i][j+12+l] = buf_to_B_4;
                        B[i+1][j+12+l] = buf_to_B_5;
                        B[i+2][j+12+l] = buf_to_B_6;
                        B[i+3][j+12+l] = buf_to_B_7;
                        l ++;
                    }
                    for (k = i; k < i + 4; k++)
                    {
                        buf_to_B_0 = B[k][j+8];
                        buf_to_B_1 = B[k][j+9];
                        buf_to_B_2 = B[k][j+10];
                        buf_to_B_3 = B[k][j+11];
                        buf_to_B_4 = B[k][j+12];
                        buf_to_B_5 = B[k][j+13];
                        buf_to_B_6 = B[k][j+14];
                        buf_to_B_7 = B[k][j+15];
                        B[k][j+4] = buf_to_B_0;
                        B[k][j+5] = buf_to_B_1;
                        B[k][j+6] = buf_to_B_2;
                        B[k][j+7] = buf_to_B_3;
                        B[k+4][j+4] = buf_to_B_4;
                        B[k+4][j+5] = buf_to_B_5;
                        B[k+4][j+6] = buf_to_B_6;
                        B[k+4][j+7] = buf_to_B_7;
                    }
                }
                // diagnal block and the lase one, use the 4x8 block adjacent to the left as buffer
                else if (i == j && i == 56)
                {
                    l = 0;
                    for (k = i; k < i + 4; k++)
                    {
                        buf_to_B_0 = A[k][j];
                        buf_to_B_1 = A[k][j+1];
                        buf_to_B_2 = A[k][j+2];
                        buf_to_B_3 = A[k][j+3];
                        buf_to_B_4 = A[k][j+4];
                        buf_to_B_5 = A[k][j+5];
                        buf_to_B_6 = A[k][j+6];
                        buf_to_B_7 = A[k][j+7];
                        B[i][j-8+l] = buf_to_B_0;
                        B[i+1][j-8+l] = buf_to_B_1;
                        B[i+2][j-8+l] = buf_to_B_2;
                        B[i+3][j-8+l] = buf_to_B_3;
                        B[i][j-4+l] = buf_to_B_4;
                        B[i+1][j-4+l] = buf_to_B_5;
                        B[i+2][j-4+l] = buf_to_B_6;
                        B[i+3][j-4+l] = buf_to_B_7;
                        l ++;
                    }
                    for (k = i; k < i + 4; k++)
                    {
                        buf_to_B_0 = B[k][j-8];
                        buf_to_B_1 = B[k][j-7];
                        buf_to_B_2 = B[k][j-6];
                        buf_to_B_3 = B[k][j-5];
                        buf_to_B_4 = B[k][j-4];
                        buf_to_B_5 = B[k][j-3];
                        buf_to_B_6 = B[k][j-2];
                        buf_to_B_7 = B[k][j-1];
                        B[k][j] = buf_to_B_0;
                        B[k][j+1] = buf_to_B_1;
                        B[k][j+2] = buf_to_B_2;
                        B[k][j+3] = buf_to_B_3;
                        B[k+4][j] = buf_to_B_4;
                        B[k+4][j+1] = buf_to_B_5;
                        B[k+4][j+2] = buf_to_B_6;
                        B[k+4][j+3] = buf_to_B_7;
                    }
                    
                    l = 0;
                    for (k = i + 4; k < i + 8; k++)
                    {
                        buf_to_B_0 = A[k][j];
                        buf_to_B_1 = A[k][j+1];
                        buf_to_B_2 = A[k][j+2];
                        buf_to_B_3 = A[k][j+3];
                        buf_to_B_4 = A[k][j+4];
                        buf_to_B_5 = A[k][j+5];
                        buf_to_B_6 = A[k][j+6];
                        buf_to_B_7 = A[k][j+7];
                        B[i][j-8+l] = buf_to_B_0;
                        B[i+1][j-8+l] = buf_to_B_1;
                        B[i+2][j-8+l] = buf_to_B_2;
                        B[i+3][j-8+l] = buf_to_B_3;
                        B[i][j-4+l] = buf_to_B_4;
                        B[i+1][j-4+l] = buf_to_B_5;
                        B[i+2][j-4+l] = buf_to_B_6;
                        B[i+3][j-4+l] = buf_to_B_7;
                        l ++;
                    }
                    for (k = i; k < i + 4; k++)
                    {
                        buf_to_B_0 = B[k][j-8];
                        buf_to_B_1 = B[k][j-7];
                        buf_to_B_2 = B[k][j-6];
                        buf_to_B_3 = B[k][j-5];
                        buf_to_B_4 = B[k][j-4];
                        buf_to_B_5 = B[k][j-3];
                        buf_to_B_6 = B[k][j-2];
                        buf_to_B_7 = B[k][j-1];
                        B[k][j+4] = buf_to_B_0;
                        B[k][j+5] = buf_to_B_1;
                        B[k][j+6] = buf_to_B_2;
                        B[k][j+7] = buf_to_B_3;
                        B[k+4][j+4] = buf_to_B_4;
                        B[k+4][j+5] = buf_to_B_5;
                        B[k+4][j+6] = buf_to_B_6;
                        B[k+4][j+7] = buf_to_B_7;
                    }
                }
            }
        }
        for (i = 0; i < 64; i = i + 8)
        {
            for (j = 0; j < 64; j = j + 8)
            {
                // if not a diagonal block, use the 4x4 block in 8x8 block as buffer
                if (i != j)
                {
                    for (k = i; k < i + 4; k++)
                    {
                        buf_to_B_0 = A[k][j];
                        buf_to_B_1 = A[k][j+1];
                        buf_to_B_2 = A[k][j+2];
                        buf_to_B_3 = A[k][j+3];
                        buf_to_B_4 = A[k][j+4];
                        buf_to_B_5 = A[k][j+5];
                        buf_to_B_6 = A[k][j+6];
                        buf_to_B_7 = A[k][j+7];
                        B[j][k] = buf_to_B_0;
                        B[j+1][k] = buf_to_B_1;
                        B[j+2][k] = buf_to_B_2;
                        B[j+3][k] = buf_to_B_3;
                        B[j][k+4] = buf_to_B_4;
                        B[j+1][k+4] = buf_to_B_5;
                        B[j+2][k+4] = buf_to_B_6;
                        B[j+3][k+4] = buf_to_B_7;
                    }
                    for (k = j; k < j + 4; k++)
                    {
                        buf_to_B_0 = B[k][i+4];
                        buf_to_B_1 = B[k][i+5];
                        buf_to_B_2 = B[k][i+6];
                        buf_to_B_3 = B[k][i+7];
                        buf_to_B_4 = A[i+4][k];
                        buf_to_B_5 = A[i+5][k];
                        buf_to_B_6 = A[i+6][k];
                        buf_to_B_7 = A[i+7][k];
                        B[k][i+4] = buf_to_B_4;
                        B[k][i+5] = buf_to_B_5;
                        B[k][i+6] = buf_to_B_6;
                        B[k][i+7] = buf_to_B_7;
                        B[k+4][i] = buf_to_B_0;
                        B[k+4][i+1] = buf_to_B_1;
                        B[k+4][i+2] = buf_to_B_2;
                        B[k+4][i+3] = buf_to_B_3;
                    }
                    for (k = j + 4; k < j + 8; k++)
                    {
                        buf_to_B_0 = A[i+4][k];
                        buf_to_B_1 = A[i+5][k];
                        buf_to_B_2 = A[i+6][k];
                        buf_to_B_3 = A[i+7][k];
                        B[k][i+4] = buf_to_B_0;
                        B[k][i+5] = buf_to_B_1;
                        B[k][i+6] = buf_to_B_2;
                        B[k][i+7] = buf_to_B_3;
                    }
                }
            }
        }
    }
    // the irregular one.... use irregular block......
    // use 3x4 block in 6x8 super block and use 3x4 block in B as buffer
    else if (61 == M)
    {
        for (i = 0; i < 64; i = i + 8)
        {
            for (j = 0; j < 60; j = j + 6)
            {    
                for (k = i; k < i + 4; k++)
                {
                    buf_to_B_0 = A[k][j];
                    buf_to_B_1 = A[k][j+1];
                    buf_to_B_2 = A[k][j+2];
                    buf_to_B_3 = A[k][j+3];
                    buf_to_B_4 = A[k][j+4];
                    buf_to_B_5 = A[k][j+5];                
                    B[j][k] = buf_to_B_0;
                    B[j+1][k] = buf_to_B_1;
                    B[j+2][k] = buf_to_B_2;
                    B[j][k+4] = buf_to_B_3;
                    B[j+1][k+4] = buf_to_B_4;
                    B[j+2][k+4] = buf_to_B_5;
                    //if j=54, j+5 is 59
                    //then there is a last one A[k][60] we should consider to avoid 'miss'
                    if (54 == j) 
                    {
                        buf_to_B_0 = A[k][60];
                        B[60][k] = buf_to_B_0;
                    }
                }
                for (k = j; k < j + 3; k++)
                {
                    buf_to_B_0 = B[k][i+4];
                    buf_to_B_1 = B[k][i+5];
                    buf_to_B_2 = B[k][i+6];
                    buf_to_B_7 = B[k][i+7];
                    buf_to_B_3 = A[i+4][k];
                    buf_to_B_4 = A[i+5][k];
                    buf_to_B_5 = A[i+6][k];
                    buf_to_B_6 = A[i+7][k];
                    B[k][i+4] = buf_to_B_3;
                    B[k][i+5] = buf_to_B_4;
                    B[k][i+6] = buf_to_B_5;
                    B[k][i+7] = buf_to_B_6;
                    B[k+3][i] = buf_to_B_0;
                    B[k+3][i+1] = buf_to_B_1;
                    B[k+3][i+2] = buf_to_B_2;
                    B[k+3][i+3] = buf_to_B_7;
                    // if i=56, i+7 is 63
                    // then there are last three we should consider to avoid "miss"
                    if (56 == i)
                    {
                        buf_to_B_0 = A[64][k];
                        buf_to_B_1 = A[65][k];
                        buf_to_B_2 = A[66][k];
                        B[k][64] = buf_to_B_0;
                        B[k][65] = buf_to_B_1;
                        B[k][66] = buf_to_B_2;
                    }
                }
                for (k = j + 3; k < j + 6; k++)
                {
                    buf_to_B_0 = A[i+4][k];
                    buf_to_B_1 = A[i+5][k];
                    buf_to_B_2 = A[i+6][k];
                    buf_to_B_3 = A[i+7][k];
                    B[k][i+4] = buf_to_B_0;
                    B[k][i+5] = buf_to_B_1;
                    B[k][i+6] = buf_to_B_2;
                    B[k][i+7] = buf_to_B_3;

                    if (59 == k)
                    {
                        buf_to_B_0 = A[i+4][60];
                        buf_to_B_1 = A[i+5][60];
                        buf_to_B_2 = A[i+6][60];
                        buf_to_B_3 = A[i+7][60];
                        B[60][i+4] = buf_to_B_0;
                        B[60][i+5] = buf_to_B_1;
                        B[60][i+6] = buf_to_B_2;
                        B[60][i+7] = buf_to_B_3;
                    }
                    if (56 == i)
                    {
                        buf_to_B_0 = A[64][k];
                        buf_to_B_1 = A[65][k];
                        buf_to_B_2 = A[66][k];
                        B[k][64] = buf_to_B_0;
                        B[k][65] = buf_to_B_1;
                        B[k][66] = buf_to_B_2;
                    }
                }
            }
        }
        // the remaining three....
        buf_to_B_0 = A[64][60];
        buf_to_B_1 = A[65][60];
        buf_to_B_2 = A[66][60];
        B[60][64] = buf_to_B_0;
        B[60][65] = buf_to_B_1;
        B[60][66] = buf_to_B_2;
    }
}

/* 
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started. 
 */ 

/* 
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, tmp;

    REQUIRES(M > 0);
    REQUIRES(N > 0);

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            tmp = A[i][j];
            B[j][i] = tmp;
        }
    }    

    ENSURES(is_transpose(M, N, A, B));
}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerTransFunction(transpose_submit, transpose_submit_desc); 

    /* Register any additional transpose functions */
    registerTransFunction(trans, trans_desc); 

}

/* 
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; ++j) {
            if (A[i][j] != B[j][i]) {
                return 0;
            }
        }
    }
    return 1;
}

