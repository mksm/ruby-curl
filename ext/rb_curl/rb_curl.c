#include <rb_curl.h>

VALUE rb_mRubyCurl;

void Init_rb_curl() {
  rb_mRubyCurl = rb_define_module("RubyCurl");

  curl_global_init(CURL_GLOBAL_NOTHING);
  
  init_rubycurl_easy();
  init_rubycurl_multi();
}
