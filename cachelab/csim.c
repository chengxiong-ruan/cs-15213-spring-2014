/*
* Author  : Chengxiong Ruan
* LoginID : cruan
*/
#include "cachelab.h"
#include <stdio.h>
#include <getopt.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define MY_MAX_PATH_LEN 128
#define IN
#define OUT

//define cache access result : miss, hit and eviction
enum CACHE_ACCESS_TYPE
{
	miss,
	miss_eviction,
	hit,
	miss_hit,
	miss_eviction_hit,
	error_access
};

// structure for line
typedef struct
{
	int valid;
	long tag;
	long access_freq_level; //range from 1 to line_num
}s_line;

// structure for set
typedef struct
{
	long line_num;
	s_line* pLine;
}s_set;

// structure for cache
typedef struct
{
	long set_num;
	s_set* pSet;
}s_cache;

// functions
int InitiCache(OUT s_cache* pCache, IN int set_bit_num, IN int block_bit_num, IN long line_num);
long GetSetIndx(IN long address, IN int set_bit_num, IN int block_bit_num);
long GetTag(IN long address, IN int set_bit_num, IN int block_bit_num);
void ParsePara(IN int argc, IN char* argv[], OUT int* ps, OUT long* pE, OUT int* pb, OUT int* pv, OUT char* pt);
void PrintUsage();
void ReleaseCache(IN s_cache* pCache);
void UpdateAccessFreqLevel(IN s_set* pSet, IN long line_indx);
enum CACHE_ACCESS_TYPE SimulateCache(IN s_cache* pCache, IN char opt_type, IN long address, IN int set_bit_num, IN int block_bit_num);

long g_hit_num = 0;
long g_miss_num = 0;
long g_evict_num = 0;

int main(int argc, char* argv[])
{

	char trace_path[MY_MAX_PATH_LEN];
	int set_bit_num;
	int block_bit_num;
	long line_num;
	int verbose_flag=0;
	int ret;
	
	char line_read[MY_MAX_PATH_LEN];
	char op_type;
	long address;
	enum CACHE_ACCESS_TYPE simul_result;

	// parse command line options
	ParsePara(argc, argv, &set_bit_num, &line_num, &block_bit_num, &verbose_flag, trace_path);

	// allocate memory for cache
	s_cache cache_simul;
	ret = InitiCache(&cache_simul, set_bit_num, block_bit_num, line_num);
	if (!ret)
	{
		printf("cache initialization failed");
		ReleaseCache(&cache_simul);
		return -1;
	}

	// read trace information line by line
	FILE* fp = fopen(trace_path, "r");
	if (NULL == fp)
	{
		printf("Open file %s failed\n", trace_path);
		return -1;
	}
	while ( NULL != fgets(line_read, MY_MAX_PATH_LEN, fp))
	{
		if (' ' != line_read[0])
		{
			continue;
		}
		line_read[strlen(line_read)-1] = '\0';
		sscanf(line_read, " %c %lx", &op_type, &address);
		// simulate cache behaviors
		simul_result = SimulateCache(&cache_simul, op_type, address, set_bit_num, block_bit_num);
		if (error_access == simul_result)
		{
			printf("simulation error!!!\n");
			ReleaseCache(&cache_simul);
			fclose(fp);
			return -1;
		}
		if (verbose_flag)
		{
			switch(simul_result)
			{
				case miss:
					printf("%s miss\n", line_read+1);
					break;
				case miss_eviction:
					printf("%s miss eviction\n", line_read+1);
					break;
				case hit:
					if('M'==op_type)
					{
						printf("%s hit hit\n", line_read+1);
					}
					else
					{
						printf("%s hit\n", line_read+1);
					}
					break;
				case miss_hit:
					printf("%s miss hit\n", line_read+1);
					break;
				case miss_eviction_hit:
					printf("%s miss eviction hit\n", line_read+1);
					break;
				default:
					printf("error\n");
			}
		}
	}
	fclose(fp);

	// release memory of cache
	ReleaseCache(&cache_simul);
	printSummary(g_hit_num, g_miss_num, g_evict_num);
	return 0;
}

/*
* ParsePara: parse the options inputted
* Input:
* argc - inputted argument number
* argv - inputted options
* Output:
* ps - pointer to set bit number
* pb - pointer to block bit number
* pv - pointer to verbose flag
* pt - pointer to trace path buffer
*/
void ParsePara(IN int argc, IN char* argv[], OUT int* ps, OUT long* pE, OUT int* pb, OUT int* pv, OUT char* pt)
{
	int valid_para_num = 0;
	int cur_opt;
	opterr = 1;
	while ( (cur_opt=getopt(argc, argv, "vs:E:b:t:h")) != -1)
	{
		switch(cur_opt)
		{
			case 'h':
				PrintUsage();
				exit(-1);
			case 'v':
				valid_para_num ++;
				*pv = 1;
				break;
			case 's':
				valid_para_num ++;
				*ps = atoi(optarg);
				break;
			case 'E':
				valid_para_num ++;
				*pE = atoi(optarg);
				break;
			case 'b':
				valid_para_num ++;
				*pb = atoi(optarg);
				break;
			case 't':
				valid_para_num ++;
				strcpy(pt, optarg);
				break;
			default :
				PrintUsage();
				exit(-1);
		}
	}

	if (4 > valid_para_num)
	{
		PrintUsage();
		exit(-1);
	}

}

/*
* PrintUsage: print "how to use" information
*/
void PrintUsage()
{
	printf("Usage: ./csim-ref [-hv] -s <num> -E <num> -b <num> -t <file>\n \
	Options:\n \
  	-h         Prlong this help message.\n \
  	-v         Optional verbose flag.\n \
  	-s <num>   Number of set index bits.\n \
  	-E <num>   Number of lines per set.\n \
  	-b <num>   Number of block offset bits.\n \
  	-t <file>  Trace file.\n\n \
	Examples:\n \
  		linux>  ./csim-ref -s 4 -E 1 -b 4 -t traces/yi.trace\n \
  		linux>  ./csim-ref -v -s 8 -E 2 -b 4 -t traces/yi.trace\n");
}

/*
* InitiCache: allocate memory for cache
* Input:
* set_bit_num - set bit number
* block_bit_num - block bit number
* line_num - line number per set
* Output:
* pCache - pointer to cache
* Return Value:
* 1 - initialization success
* 0 - failed
*/
int InitiCache(OUT s_cache* pCache, IN int set_bit_num, IN int block_bit_num, IN long line_num)
{
	long i;
	long j;
	long tmp = 1;
	pCache->set_num =  tmp << set_bit_num;
	pCache->pSet = (s_set*)malloc(pCache->set_num*sizeof(s_set));
	if (pCache->pSet == NULL) 
	{
		printf("allocate memory for cache sets failed\n");
		return 0;
	}
	for (i = 0; i < pCache->set_num; i++)
	{
		(pCache->pSet[i]).line_num = line_num;
		(pCache->pSet[i]).pLine = (s_line*)malloc(line_num*sizeof(s_line));
		if ((pCache->pSet[i]).pLine == NULL)
		{
			printf("allocate memory for line %ld of set %ld failed\n", j, i);
			return 0;
		}
		for (j = 0; j < line_num; j++)
		{
			((pCache->pSet[i]).pLine[j]).valid = 0;
			((pCache->pSet[i]).pLine[j]).tag = 0;
			((pCache->pSet[i]).pLine[j]).access_freq_level = 1;
		}
	}
	return 1;
}

/*
* ReleaseCache: release memory allocated for cache
* Input:
* pCache - pointer to cache
*/
void ReleaseCache(IN s_cache* pCache)
{
	long i;
	long set_num = pCache->set_num;
	for (i = 0; i < set_num; ++i)
	{
		if ( (pCache->pSet[i]).pLine != NULL )
		{
			free( (pCache->pSet[i]).pLine );
			(pCache->pSet[i]).pLine = NULL;
		}
	}

	if (pCache->pSet != NULL)
	{
		free(pCache->pSet);
		pCache->pSet = NULL;
	}
}

/*
* GetSetIndx: parse set index from address
* Input:
* address - address from trace file
* set_bit_num - set bit number
* block_bit_num - block bit number
* Return:
* set index value
*/
long GetSetIndx(IN long address, IN int set_bit_num, IN int block_bit_num)
{
	long mask = 0x7fffffffffffffff >> (63 - set_bit_num);
	long indx = address >> (block_bit_num);
	indx = indx & mask;
	return indx;
}

/*
* GetTag: get tag value from address
* Input:
* address - address from trace file
* set_bit_num - set bit number
* block_bit_num - block bit number
* Return:
* tag value
*/
long GetTag(IN long address, IN int set_bit_num, IN int block_bit_num)
{
	long mask = 0x7fffffffffffffff >> (set_bit_num + block_bit_num - 1);
	long tag = address >> (set_bit_num+block_bit_num);
	tag = tag & mask;
	return tag;
}

/*
* SimulateCache: simulate cache actions
* Input:
* pCache - pointer to cache
* opt_type - operation type ('M', 'S', 'L') 
* address - address from trace file
* set_bit_num - set bit number
* block_bit_num - block bit number
* Return:
* return the result of one cache access : miss, miss_eviction, hit, miss_hit, miss_eviction_hit, error_access 
*/
enum CACHE_ACCESS_TYPE SimulateCache(IN s_cache* pCache, IN char opt_type, IN long address, IN int set_bit_num, IN int block_bit_num)
{
	long i;
	long line_num = (pCache->pSet[0]).line_num;
	long set_indx = GetSetIndx(address, set_bit_num, block_bit_num);
	long tag = GetTag(address, set_bit_num, block_bit_num);
	s_set cur_set = pCache->pSet[set_indx];

	//when hit
	for (i = 0; i < line_num; i++)
	{
		if (cur_set.pLine[i].valid && cur_set.pLine[i].tag==tag)
		{
			UpdateAccessFreqLevel(&cur_set, i);
			if ('M' == opt_type)
			{
				g_hit_num += 2;
			}
			else
			{
				g_hit_num ++;
			}
			return hit;
		}
	}

	g_miss_num ++;
	//when miss, seek for an empty line
	for (i = 0; i < line_num; i++)
	{
		if (0 == cur_set.pLine[i].valid)
		{
			cur_set.pLine[i].valid = 1;
			cur_set.pLine[i].tag = tag;
			UpdateAccessFreqLevel(&cur_set, i);
			if ('M' == opt_type)
			{
				g_hit_num ++;
				return miss_hit;
			}
			else
			{
				return miss;
			}
		}
	}

	g_evict_num ++;
	//when eviction
	for (i = 0; i < line_num; i++)
	{
		if (1 == cur_set.pLine[i].access_freq_level)
		{
			cur_set.pLine[i].valid = 1;
			cur_set.pLine[i].tag = tag;
			UpdateAccessFreqLevel(&cur_set, i);
			if ('M' == opt_type)
			{
				g_hit_num ++;
				return miss_eviction_hit;
			}
			else
			{
				return miss_eviction;
			}
		}
	}

	return error_access;
}

/*
* UpdateAccessFreqLevel: update the information about which line is access most recently
* Input:
* pSet - pointer to the set accessed
* line_indx - index of line currently accessed
*/
void UpdateAccessFreqLevel(IN s_set* pSet, IN long line_indx)
{
	long i;
	long line_num = pSet->line_num;
	
	for (i = 0; i < line_num; i++)
	{
		if ( (i != line_indx) && (pSet->pLine[i].access_freq_level > pSet->pLine[line_indx].access_freq_level) )
		{
			pSet->pLine[i].access_freq_level --;
		}
	}
	pSet->pLine[line_indx].access_freq_level = line_num;
}
