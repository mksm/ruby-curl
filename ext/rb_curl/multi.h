#ifndef RUBYCURL_MULTI
#define RUBYCURL_MULTI

#include <rb_curl.h>
#include <easy.h>

typedef struct {
  CURLM *multi;
} CurlMulti;

#endif
