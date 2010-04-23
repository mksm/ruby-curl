#ifndef RUBYCURL_EASY
#define RUBYCURL_EASY

#include <rb_curl.h>

void init_rubycurl_easy();

typedef struct {
  CURL *curl;
  struct curl_slist *headers;
} CurlEasy;

#endif
