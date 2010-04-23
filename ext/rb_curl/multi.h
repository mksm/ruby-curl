#ifndef RUBYCURL_MULTI
#define RUBYCURL_MULTI

#include <rb_curl.h>
#include <easy.h>

VALUE cMulti;

typedef struct {
  int running;
  int active;
  CURLM *multi;
} CurlMulti;

void init_rubycurl_multi();

#endif
