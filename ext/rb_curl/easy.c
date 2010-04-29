#include <easy.h>

VALUE rb_cEasy;

static void dealloc(CurlEasy *curl_easy) {
  if (curl_easy->headers != NULL) {
    curl_slist_free_all(curl_easy->headers);
  }

  curl_easy_cleanup(curl_easy->curl);

  free(curl_easy);
}


/*
 * Set options functions based on curl_easy_setopt.
 *
 * These just provide an interface so we can set FLAG's value from ruby.
 * 
 */
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


/*
 * Get information functions based on curl_easy_getinfo.
 * 
 * These are just an interface so we can easily access the FLAGs from ruby.
 */
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


/*
 * curl_easy_perform
 */
static VALUE easy_perform(VALUE self) {
  CurlEasy *curl_easy;
  Data_Get_Struct(self, CurlEasy, curl_easy);

  CURLcode rcode;
  rcode = curl_easy_perform(curl_easy->curl);

  if (rcode > 0)
    rb_exc_raise(rb_str_new2(curl_easy_strerror(rcode)));

  return self;
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


/*
 * Default write function to write to ruby string.
 * Default handlers for body and headers.
 */

static size_t write_data_handler(char *stream, size_t size, size_t nmemb, VALUE out) {
  rb_str_cat(out, stream, size * nmemb);
  return size * nmemb;
}

static void set_response_handlers(VALUE easy, CURL *curl) {
  rb_iv_set(easy, "@body_str",   rb_str_new2(""));
  rb_iv_set(easy, "@header_str", rb_str_new2(""));

  curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION,  (curl_write_callback)&write_data_handler);
  curl_easy_setopt(curl, CURLOPT_WRITEDATA,      rb_iv_get(easy, "@body_str"));
  curl_easy_setopt(curl, CURLOPT_HEADERFUNCTION, (curl_write_callback)&write_data_handler);
  curl_easy_setopt(curl, CURLOPT_HEADERDATA,     rb_iv_get(easy, "@header_str"));
}


/*
 * rb_initialize
 */
static VALUE rb_initialize(int argc, VALUE *argv, VALUE klass) {
  CurlEasy *curl_easy;
  VALUE    rb_easy;

  curl_easy = ALLOC(CurlEasy);
  curl_easy->curl    = curl_easy_init();
  curl_easy->headers = NULL;
  
  rb_easy = Data_Wrap_Struct(rb_cEasy, 0, dealloc, curl_easy);

  // save rb_easy in PRIVATE area of handler.
  curl_easy_setopt(curl_easy->curl, CURLOPT_PRIVATE, rb_easy);

  // set default handlers for body and header response.
  set_response_handlers(rb_easy, curl_easy->curl);

  // pass arguments to ruby object
  rb_obj_call_init(rb_easy, argc, argv);

  return rb_easy;
}


/*
 * Ruby interface
 */
void init_rubycurl_easy() {
  rb_cEasy = rb_define_class_under(rb_mRubyCurl, "Easy", rb_cObject);

  rb_define_singleton_method(rb_cEasy, "new", rb_initialize, -1);
  
  rb_define_private_method(rb_cEasy, "easy_setopt_string",      easy_setopt_string,     2);
  rb_define_private_method(rb_cEasy, "easy_setopt_long",        easy_setopt_long,       2);

  rb_define_private_method(rb_cEasy, "easy_getinfo_string",     easy_getinfo_string,    1);
  rb_define_private_method(rb_cEasy, "easy_getinfo_long",       easy_getinfo_long,      1);
  rb_define_private_method(rb_cEasy, "easy_getinfo_double",     easy_getinfo_double,    1);

  rb_define_private_method(rb_cEasy, "easy_perform",            easy_perform,           0);

  rb_define_private_method(rb_cEasy, "easy_append_header",      easy_append_header,     1);
  rb_define_private_method(rb_cEasy, "easy_setopt_httpheaders", easy_setopt_httpheader, 0);
}
