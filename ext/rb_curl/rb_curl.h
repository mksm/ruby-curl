#include <ruby.h>
#include <curl/curl.h>
#include <curl/easy.h>
#include <curl/multi.h>

void Init_rb_curl();

extern VALUE rb_mRubyCurl;
extern void init_rubycurl_easy();
extern void init_rubycurl_multi();
