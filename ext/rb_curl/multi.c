#include <multi.h>

VALUE rb_cMulti;

static void dealloc(CurlMulti *curl_multi) {
  curl_multi_cleanup(curl_multi->multi);
  free(curl_multi);
}


/*
 * curl_multi_add_handle
 */
static VALUE rb_multi_add_handle(VALUE rb_self, VALUE rb_easy)
{
  CurlEasy  *curl_easy;
  CurlMulti *curl_multi;
  Data_Get_Struct(rb_easy, CurlEasy, curl_easy);
  Data_Get_Struct(rb_self, CurlMulti, curl_multi);

  CURLMcode multi_code = curl_multi_add_handle(curl_multi->multi, curl_easy->curl);

  if (multi_code != CURLM_OK && multi_code != CURLM_CALL_MULTI_PERFORM) {
    rb_exc_raise(rb_str_new2(curl_multi_strerror(multi_code)));
  };

  return rb_easy;
}


/*
 * curl_multi_remove_handle
 */
static VALUE rb_multi_remove_handle(VALUE rb_self, VALUE rb_easy) {
  CurlEasy  *curl_easy;
  CurlMulti *curl_multi;
  Data_Get_Struct(rb_easy, CurlEasy,  curl_easy);
  Data_Get_Struct(rb_self, CurlMulti, curl_multi);

  CURLMcode multi_code = curl_multi_remove_handle(curl_multi->multi, curl_easy->curl);

  if (multi_code != CURLM_OK && multi_code != CURLM_CALL_MULTI_PERFORM) {
    //error
  };

  return rb_easy;
}


/*
 * curl_multi_setopt
 */
static VALUE rb_multi_setopt_long(VALUE self, VALUE opt_name, VALUE parameter) {
  CurlMulti *curl_multi;
  Data_Get_Struct(self, CurlMulti, curl_multi);

  long opt = NUM2LONG(opt_name);
  curl_multi_setopt(curl_multi->multi, opt, NUM2LONG(parameter));

  return opt_name;
}


/*
 * ****************************************************************************
 * Still old stuff from typhoeus
 * ****************************************************************************
 */

static void multi_read_info(VALUE self, CURLM *multi_handle) {
  int msgs_left, result;
  CURLMsg *msg;
  CURLcode ecode;
  CURL *easy_handle;
  VALUE easy;

  /* check for finished easy handles and remove from the multi handle */
  while ((msg = curl_multi_info_read(multi_handle, &msgs_left))) {

    if (msg->msg != CURLMSG_DONE) {
      continue;
    }

    easy_handle = msg->easy_handle;
    result = msg->data.result;
    if (easy_handle) {
      ecode = curl_easy_getinfo(easy_handle, CURLINFO_PRIVATE, &easy);
      if (ecode != 0) {
        rb_raise(ecode, "error getting easy object");
      }

      rb_multi_remove_handle(self, easy);

      /*
      if (result != 0) {
        rb_funcall(easy, rb_intern("failure"), 0);
      }
      else if ((response_code >= 200 && response_code < 300) || response_code == 0) {
        rb_funcall(easy, rb_intern("success"), 0);
      }
      else if (response_code >= 300 && response_code < 600) {
        rb_funcall(easy, rb_intern("failure"), 0);
      }
      */
    }
  }
}

/* called by multi_perform and fire_and_forget */
static void rb_curl_multi_run(VALUE self, CURLM *multi_handle, int *still_running) {
  CURLMcode mcode;

  do {
    mcode = curl_multi_perform(multi_handle, still_running);
  } while (mcode == CURLM_CALL_MULTI_PERFORM);

  if (mcode != CURLM_OK) {
    rb_raise((VALUE)mcode, "an error occured while running perform");
  }

  multi_read_info( self, multi_handle );
}


static VALUE multi_perform(VALUE self) {
  CURLMcode mcode;
  CurlMulti *curl_multi;
  CurlEasy  *curl_easy;
  int maxfd, rc;
  fd_set fdread, fdwrite, fdexcep;

  long timeout;
  struct timeval tv = {0, 0};

  Data_Get_Struct(self, CurlMulti, curl_multi);

  int running;
  rb_curl_multi_run( self, curl_multi->multi, &running );
  
  while(running) {
    FD_ZERO(&fdread);
    FD_ZERO(&fdwrite);
    FD_ZERO(&fdexcep);

    /* get the curl suggested time out */
    mcode = curl_multi_timeout(curl_multi->multi, &timeout);
    if (mcode != CURLM_OK) {
      rb_raise((VALUE)mcode, "an error occured getting the timeout");
          }

    if (timeout == 0) { /* no delay */
      rb_curl_multi_run( self, curl_multi->multi, &running );
      continue;
    }
    else if (timeout < 0) {
      timeout = 1;
    }

    tv.tv_sec = timeout / 1000;
    tv.tv_usec = (timeout * 1000) % 1000000;

    /* load the fd sets from the multi handle */
    mcode = curl_multi_fdset(curl_multi->multi, &fdread, &fdwrite, &fdexcep, &maxfd);
    if (mcode != CURLM_OK) {
      rb_raise((VALUE)mcode, "an error occured getting the fdset");
    }

    rc = rb_thread_select(maxfd+1, &fdread, &fdwrite, &fdexcep, &tv);
    if (rc < 0) {
      rb_raise(rb_eRuntimeError, "error on thread select");
    }
    rb_curl_multi_run( self, curl_multi->multi, &running );

  }

  return Qtrue;
}

/*
 * rb_multi_new
 */
static VALUE rb_multi_new(VALUE klass)
{
  CurlMulti *curl_multi = ALLOC(CurlMulti);
  curl_multi->multi = curl_multi_init();

  VALUE rb_multi = Data_Wrap_Struct(klass, NULL, dealloc, curl_multi);

  rb_obj_call_init(rb_multi, NULL, NULL);

  return rb_multi;
}


/*
 * Ruby interface
 */
void init_rubycurl_multi() {
  rb_cMulti = rb_define_class_under(rb_mRubyCurl, "Multi", rb_cObject);

  rb_define_singleton_method(rb_cMulti, "new", rb_multi_new, 0);

  rb_define_private_method(rb_cMulti, "multi_add_handle",    rb_multi_add_handle,    1);
  rb_define_private_method(rb_cMulti, "multi_remove_handle", rb_multi_remove_handle, 1);

  rb_define_private_method(rb_cMulti, "multi_setopt_long",   rb_multi_setopt_long,   2);

  rb_define_private_method(rb_cMulti, "multi_perform",       multi_perform,       0);
  //rb_define_private_method(rb_cMulti, "multi_cleanup",       multi_cleanup,       0);
  //rb_define_private_method(rb_cMulti, "active_handle_count", active_handle_count, 0);
}
