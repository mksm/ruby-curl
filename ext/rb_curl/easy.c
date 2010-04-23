#include <easy.h>

VALUE rb_cEasy;

static void dealloc(CurlEasy *curl_easy) {
  if (curl_easy->headers != NULL) {
    curl_slist_free_all(curl_easy->headers);
  }

  curl_easy_cleanup(curl_easy->curl);

  free(curl_easy);
}

static VALUE easy_setopt_string(VALUE self, VALUE opt_name, VALUE parameter) {
  CurlEasy *curl_easy;
  Data_Get_Struct(self, CurlEasy, curl_easy);

  long opt = NUM2LONG(opt_name);
  curl_easy_setopt(curl_easy->curl, opt, StringValuePtr(parameter));

  return opt_name;
}

static VALUE easy_setopt_long(VALUE self, VALUE opt_name, VALUE parameter) {
  CurlEasy *curl_easy;
  Data_Get_Struct(self, CurlEasy, curl_easy);

  long opt = NUM2LONG(opt_name);
  curl_easy_setopt(curl_easy->curl, opt, NUM2LONG(parameter));

  return opt_name;
}

static VALUE easy_getinfo_string(VALUE self, VALUE info) {
  char *info_string;
  CurlEasy *curl_easy;
  Data_Get_Struct(self, CurlEasy, curl_easy);

  long opt = NUM2LONG(info);
  curl_easy_getinfo(curl_easy->curl, opt, &info_string);

  return rb_str_new2(info_string);
}

static VALUE easy_getinfo_long(VALUE self, VALUE info) {
  long info_long;
  CurlEasy *curl_easy;
  Data_Get_Struct(self, CurlEasy, curl_easy);

  long opt = NUM2LONG(info);
  curl_easy_getinfo(curl_easy->curl, opt, &info_long);

  return LONG2NUM(info_long);
}

static VALUE easy_getinfo_double(VALUE self, VALUE info) {
  double info_double = 0;
  CurlEasy *curl_easy;
  Data_Get_Struct(self, CurlEasy, curl_easy);

  long opt = NUM2LONG(info);
  curl_easy_getinfo(curl_easy->curl, opt, &info_double);

  return rb_float_new(info_double);
}

static VALUE easy_perform(VALUE self) {
  CurlEasy *curl_easy;
  Data_Get_Struct(self, CurlEasy, curl_easy);

  curl_easy_perform(curl_easy->curl);

  return Qnil;
}

/*
 * Manipulate libcurl request headers through slists and CURLOPT_HTTPHEADER.
 */

static VALUE easy_append_header(VALUE self, VALUE header) {
  CurlEasy *curl_easy;
  Data_Get_Struct(self, CurlEasy, curl_easy);

  curl_easy->headers = curl_slist_append(curl_easy->headers, RSTRING_PTR(header));

  return header;
}

static VALUE easy_setopt_httpheader(VALUE self) {
  CurlEasy *curl_easy;
  Data_Get_Struct(self, CurlEasy, curl_easy);

  if (curl_easy->headers != NULL) {
    curl_easy_setopt(curl_easy->curl, CURLOPT_HTTPHEADER, curl_easy->headers);
    curl_slist_free_all(curl_easy->headers);
    curl_easy->headers = NULL;
  }

  return Qnil;
}


static VALUE new(int argc, VALUE *argv, VALUE klass) {
  CURL *curl = curl_easy_init();
  CurlEasy *curl_easy = ALLOC(CurlEasy);
  VALUE easy;

  curl_easy->curl = curl;
  curl_easy->headers = NULL;

  easy = Data_Wrap_Struct(rb_cEasy, 0, dealloc, curl_easy);

  rb_obj_call_init(easy, argc, argv);

  return easy;
}


void init_rubycurl_easy() {
  rb_cEasy = rb_define_class_under(rb_mRubyCurl, "Easy", rb_cObject);

  rb_define_singleton_method(rb_cEasy, "new", new, -1);
  
  rb_define_private_method(rb_cEasy, "easy_setopt_string",      easy_setopt_string,     2);
  rb_define_private_method(rb_cEasy, "easy_setopt_long",        easy_setopt_long,       2);

  rb_define_private_method(rb_cEasy, "easy_getinfo_string",     easy_getinfo_string,    1);
  rb_define_private_method(rb_cEasy, "easy_getinfo_long",       easy_getinfo_long,      1);
  rb_define_private_method(rb_cEasy, "easy_getinfo_double",     easy_getinfo_double,    1);

  rb_define_private_method(rb_cEasy, "easy_perform",            easy_perform,           0);

  rb_define_private_method(rb_cEasy, "easy_append_header",      easy_append_header,     1);
  rb_define_private_method(rb_cEasy, "easy_setopt_httpheaders", easy_setopt_httpheader, 0);
}
