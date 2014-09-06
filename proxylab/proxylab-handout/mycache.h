#include <stdio.h>
#include <getopt.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "csapp.h"


#define CACHE_SIZE 1049000
#define BUFFER_SIZE 102400
#define URI_SIZE 1024

typedef struct
{
	int valid;
	int access_freq_level;
	int valid_buf_size;
	char uri[MAXLINE];
	char buf[BUFFER_SIZE];
} s_buf_block;

typedef struct
{
	int buf_num;
	s_buf_block* pbuf;
} s_cache;

int init_cache(s_cache* pcache);
void delete_cache(s_cache* pcache);
char* check_for_cache(char* uri, s_cache* pcache, int* buf_size);
void insert_to_cache(char* uri, char* src_buf, int src_size, s_cache* pcache);
void update_freq_level(s_cache* pcache, int indx);