/*
Author : Chengxiong Ruan
AndrewID : cruan
*/
#include <stdio.h>
#include "csapp.h"
#include "sbuf.h"
#include "mycache.h"

/* Recommended max cache and object sizes */
#define MAX_CACHE_SIZE 1049000
#define MAX_OBJECT_SIZE 102400

// target server port
#define SERVER_PORT 80 // default port of server
#define THREAD_NUM 5 // the number of threads in pool
#define SBUF_SIZE 16 // the size of buffer for producer and comsumer model

/* You won't lose style points for including these long lines in your code */
static const char *user_agent_hdr = "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:10.0.3) Gecko/20120305 Firefox/10.0.3\r\n";
static const char *accept_hdr = "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\n";
static const char *accept_encoding_hdr = "Accept-Encoding: gzip, deflate\r\n";
static const char *connection_hdr = "Connection: close\r\n";
static const char *proxy_connection_hdr = "Proxy-Connection: close\r\n";

// thread function
void* thread_func(void *vargp);
// do function for each thread
void doit(int connfd);
// parse request from client
int parse_request(char* uri, char* host_name, char* new_uri, char* port);
// get header name from each line of request read
void get_header_name(char *header, char *header_name);
// if the header is listed in the writeup, then ignore it
int be_ignore_header(char *header_name);
// generate a new request forwarded to server
void generate_forward_request(rio_t* client_request_rio, char* client_request_buf, char* forward_request_buf, char* host_name, char* new_uri);

// for multi-thread
sbuf_t sbuf;
// for cache
s_cache cache;
pthread_mutex_t mutex;

/*
* main function
*/
int main(int argc, char **argv)
{
	int i, listenfd, connfd, port;
    struct sockaddr_in clientaddr;
    socklen_t clientlen = sizeof(clientaddr);
    pthread_t tid;

    /* Check command line args */
    if (argc != 2) {
	   fprintf(stderr, "usage: %s <port>\n", argv[0]);
	   exit(1);
    }
    port = atoi(argv[1]); // get proxy port
    sbuf_init(&sbuf, SBUF_SIZE); // initialize producer and comsumer model
    pthread_mutex_init(&mutex, NULL); // initialize mutext for cache access lock
    Signal(SIGPIPE, SIG_IGN); // ingore SIGPIPE signal
    init_cache(&cache); // initialize cache

    listenfd = Open_listenfd(port); // open proxy listen

    // create thread pool
    for ( i = 0; i < THREAD_NUM; i++) {
        Pthread_create(&tid, NULL, thread_func, NULL);
    }

    // listen to request from client
    while (1) {
    	connfd = Accept(listenfd, (SA *)&clientaddr, &clientlen);
        sbuf_insert(&sbuf, connfd); // insert connfd into a available slot
    }

    return 0;
}

/*
* thread function
*/
void *thread_func(void *vargp) {
    // detach threads
    Pthread_detach(pthread_self());
    while (1) {
        // get a connfd from slots
        int connfd = sbuf_remove(&sbuf);
        doit(connfd);
        Close(connfd);
    }
}

/*
* response to request
*/
void doit(int connfd)
{
    int port = SERVER_PORT; // default server port
    int port_flag = 0; // be 0 if there is no port information in url, otherwise, be 1
    int n; // how much byte read from io
    int forward_client_fd; // fd created as client to send request to server
	rio_t client_request_rio; // read from client request
    rio_t server_recieve_rio; // read from server response 
	char client_request_buf[MAXLINE]; // buf for reading client request
    char forward_request_buf[MAX_OBJECT_SIZE]; // buf for sending request to server
    char server_recieve_buf[MAX_OBJECT_SIZE]; // buf for recieving response from server
	char method[MAXLINE]; // request method
	char uri[MAXLINE]; //request uri
	char version[MAXLINE]; // request version
	char host_name[MAXLINE]; // request host name
    char new_uri[MAXLINE]; // uri without host name
    char port_name[10] = {0}; // port number read from client request if there is some

    // read request from client through connection fd
	Rio_readinitb(&client_request_rio, connfd);
	n = Rio_readlineb(&client_request_rio, client_request_buf, MAXLINE);
    client_request_buf[n] = '\0';
	sscanf(client_request_buf, "%s %s %s", method, uri, version);
    printf("method : %s\n", method);
    printf("uri : %s\n", uri);
    printf("version %s\n", version);
	if (strcasecmp(method, "GET")) { 
        printf("not get method\n");
        return;
    }

    // parse request from client
    printf("parsing request .... \n");
    port_flag = parse_request(uri, host_name, new_uri, port_name);
    printf("uri : %s\n", new_uri);
    printf("host_name : %s\n", host_name);

    // read cache
    int cache_size;
    pthread_mutex_lock(&mutex);
    printf("lock cache \n");
    char* cache_buf = check_for_cache(uri, &cache, &cache_size);
    // check if there is a cache hit
    // if hit, read directly from cache
    if (cache_buf != NULL) {
        Rio_writen(connfd, cache_buf, cache_size);
        printf("get cache\n");
        printf("cache unlock \n");
        return;
    }
    pthread_mutex_unlock(&mutex);

    // if there is flag in client request, use the port specified
    if (port_flag) {
        port = atoi(port_name);
    }
    generate_forward_request(&client_request_rio, client_request_buf,
        forward_request_buf, host_name, new_uri);
    if ( (forward_client_fd = Open_clientfd(host_name, port)) < 0 ) {
        return;
    }
    // send request and get response
    Rio_writen(forward_client_fd, forward_request_buf, strlen(forward_request_buf));
    Rio_readinitb(&server_recieve_rio, forward_client_fd);
    int data_size = 0;
    while ((n = Rio_readnb(&server_recieve_rio, server_recieve_buf, MAX_OBJECT_SIZE)) > 0) {
        Rio_writen(connfd, server_recieve_buf, n);
        data_size += n;
    }
    // if data size if smaller than MAX, cache it  
    if (data_size <= MAX_OBJECT_SIZE) {
        pthread_mutex_lock(&mutex);
        insert_to_cache(uri, server_recieve_buf, data_size, &cache);
        pthread_mutex_unlock(&mutex);
    }
    printf("cache unlock \n");
    Close(forward_client_fd);
}

// get host name, uri, port
int parse_request(char* uri, char* host_name, char* new_uri, char* port)
{
    char *p = uri+7;
    char *p_port;
    int end_idx = 0;
    int port_flag = 0;

    while (*p != '\0') {
        if (*p == ':') {
            port_flag = 1;
            p_port = p;
        }
        if (*p == '/') {
            break;
        }
        end_idx++;
        p++;
    }
    strcpy(new_uri, p);
    if (port_flag){
        strncpy(host_name, uri+7, p_port - uri - 7);
        host_name[p_port - uri - 7] = '\0';
        strncpy(port, p_port+1, p - p_port);
        port[p-p_port] = '\0';
    } else {
        strncpy(host_name, uri+7, end_idx);
        host_name[end_idx] = '\0';
    }
    return port_flag;
}

// get header name
void get_header_name(char *header, char *header_name)
{
    memset(header_name, 0x0, MAXLINE);
    memcpy(header_name, header, (strchr(header, ':') - header));
}

// is the header should be ignore?
int be_ignore_header(char *header_name)
{
    if (!strcmp("User-Agent", header_name)) {
        return 1;
    }
    else if (!strcmp("Accept", header_name)) {
        return 1;
    }
    else if (!strcmp("Accept-Encoding", header_name)) {
        return 1;
    }
    else if (!strcmp("Connection", header_name)) {
        return 1;
    }
    else if (!strcmp("Proxy-Connection", header_name)) {
        return 1;
    }
    return 0;
}

// generate request strings to forward request
void generate_forward_request(rio_t* client_request_rio, char* client_request_buf,
 char* forward_request_buf, char* host_name, char* new_uri)
{
    int n;
    char header_name[MAXLINE];

    memset(forward_request_buf, 0x0, MAXLINE);
    strcat(forward_request_buf, "GET ");
    strcat(forward_request_buf, new_uri);
    strcat(forward_request_buf, " HTTP/1.0\r\n");
    int host_name_hdr_flag = 0;

    if ((n = rio_readlineb(client_request_rio, client_request_buf, MAXLINE)) < 0 ) {
        printf("read from client error\n");
        return ;
    }
    while(strcmp(client_request_buf, "\r\n")) {
        get_header_name(client_request_buf, header_name);
        if (!be_ignore_header(header_name)) {
            if (!strcmp("Host",header_name)) {
                host_name_hdr_flag = 1;
            }
            strcat(forward_request_buf, client_request_buf);
        }
        if ((n = rio_readlineb(client_request_rio, client_request_buf, MAXLINE)) < 0 ) {
            printf("read from client error\n");
            return;
        }
    }
    if (!host_name_hdr_flag) {
        strcat(forward_request_buf, "Host: ");
        strcat(forward_request_buf, host_name);
        strcat(forward_request_buf, "\r\n");
    }
    strcat(forward_request_buf, user_agent_hdr);
    strcat(forward_request_buf, accept_hdr);
    strcat(forward_request_buf, accept_encoding_hdr);
    strcat(forward_request_buf, connection_hdr);
    strcat(forward_request_buf, proxy_connection_hdr);
    strcat(forward_request_buf, "\r\n");
}
