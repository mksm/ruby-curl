#ifndef RUBYCURL_EASY
#define RUBYCURL_EASY

#include <rb_curl.h>

typedef struct {
  CURL *curl;
  struct curl_slist *headers;
} CurlEasy;

void init_rubycurl_easy();

#endif
