#include "mycache.h"

int init_cache(s_cache* pcache) {
	int i;
	pcache->pbuf = NULL;
	pcache->buf_num = CACHE_SIZE / BUFFER_SIZE;
	pcache->pbuf = (s_buf_block *)malloc(pcache->buf_num * sizeof(s_buf_block));
	if (pcache->pbuf == NULL)
	{
		printf("cache initialization failed\n");
		return 0;
	}

	for (i = 0; i < pcache->buf_num; i++)
	{
		pcache->pbuf[i].valid = 1;
		pcache->pbuf[i].access_freq_level = 1;
	}
	return 1;
}

char* check_for_cache(char* uri, s_cache* pcache, int* buf_size) {
	int i;
	for (i = 0; i < pcache->buf_num; i++)
	{
		if (!strcmp(uri, pcache->pbuf[i].uri))
		{
			update_freq_level(pcache, i);
			*buf_size = pcache->pbuf[i].valid_buf_size;
			return pcache->pbuf[i].buf;
		}
	}
	return NULL;
}

void insert_to_cache(char* uri, char* src_buf, int src_size, s_cache* pcache) {
	int i;
	for (i = 0; i < pcache->buf_num; i++)
	{
		if (pcache->pbuf[i].valid == 1)
		{
			memcpy(pcache->pbuf[i].buf, src_buf, src_size);
			strcpy(pcache->pbuf[i].uri, uri);
			pcache->pbuf[i].valid = 0;
			pcache->pbuf[i].valid_buf_size = src_size;
			update_freq_level(pcache, i);
			return;
		}
	}

	for (i = 0; i < pcache->buf_num; i++)
	{
		if (pcache->pbuf[i].access_freq_level == 1)
		{
			memcpy(pcache->pbuf[i].buf, src_buf, src_size);
			strcpy(pcache->pbuf[i].uri, uri);
			pcache->pbuf[i].valid_buf_size = src_size;
			update_freq_level(pcache, i);
			return;
		}
	}
}

void update_freq_level(s_cache* pcache, int indx) {
	int i;
	int cur_level;
	int indx_level = pcache->pbuf[indx].access_freq_level;
	for (i = 0; i < pcache->buf_num; i++)
	{
		cur_level = pcache->pbuf[i].access_freq_level;
		if ( (i!=indx) && (cur_level>indx_level) )
		{
			pcache->pbuf[i].access_freq_level --;
		}
	}
	pcache->pbuf[indx].access_freq_level = pcache->buf_num;
}

void delete_cache(s_cache* pcache) {
	if (pcache->pbuf != NULL)
	{
		free(pcache->pbuf);
	}
}