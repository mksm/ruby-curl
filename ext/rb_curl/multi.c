#include <multi.h>

VALUE rb_cMulti;

static void dealloc(CurlMulti *curl_multi) {
  curl_multi_cleanup(curl_multi->multi);
  free(curl_multi);
}


/*
 * curl_multi_add_handle
 */
static VALUE rb_multi_add_handle(VALUE rb_self, VALUE rb_easy) {
  CurlEasy  *curl_easy;
  CurlMulti *curl_multi;
  Data_Get_Struct(rb_easy, CurlEasy,  curl_easy);
  Data_Get_Struct(rb_self, CurlMulti, curl_multi);

  CURLMcode multi_code;
  multi_code = curl_multi_add_handle(curl_multi->multi, curl_easy->curl);

  if (multi_code != CURLM_OK && multi_code != CURLM_CALL_MULTI_PERFORM) {
    //error
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

  CURLMcode multi_code;
  multi_code = curl_multi_remove_handle(curl_multi->multi, curl_easy->curl);

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

      long response_code = -1;
      curl_easy_getinfo(easy_handle, CURLINFO_RESPONSE_CODE, &response_code);

      // TODO: find out what the real problem is here and fix it.
      // this next bit is a horrible hack. For some reason my tests against a local server on my laptop
      // fail intermittently and return this result number. However, it will succeed if you try it a few
      // more times. Also noteworthy is that this doens't happen when hitting an external server. WTF?!

      // Sandofsky says:
      // This is caused by OS X first attempting to resolve using IPV6.
      // Hack solution: connect to yourself with 127.0.0.1, not localhost
      // http://curl.haxx.se/mail/tracker-2009-09/0018.html
      /*
      if (result == 7) {
        VALUE max_retries = rb_funcall(easy, rb_intern("max_retries?"), 0);
        if (max_retries != Qtrue) {
          rb_multi_remove_handle(self, easy);
          rb_multi_add_handle(self, easy);
          CurlMulti *curl_multi;
          Data_Get_Struct(self, CurlMulti, curl_multi);
          int running;
          curl_multi_perform(curl_multi->multi, &running);

          rb_funcall(easy, rb_intern("increment_retries"), 0);

          continue;
        }
      }
      */
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

static int multi_finished_easy(CURLM *multi_handle, CURL *easy_handle) {
  CURLMsg *msg;
  int msgs_left;

  /* check for finished easy handles and remove from the multi handle */
  while ((msg = curl_multi_info_read(multi_handle, &msgs_left))) {

    if(msg->easy_handle == easy_handle && msg->msg == CURLMSG_DONE) {
      return 1;
    }
    else 
      continue;
  }
  return 0;
}

static VALUE multi_perform(VALUE self, VALUE rb_easy) {
  CURLMcode mcode;
  CurlMulti *curl_multi;
  CurlEasy  *curl_easy;
  int maxfd, rc;
  fd_set fdread, fdwrite, fdexcep;

  long timeout;
  struct timeval tv = {0, 0};

  Data_Get_Struct(self, CurlMulti, curl_multi);
  Data_Get_Struct(rb_easy, CurlEasy, curl_easy);

  int running;
  //rb_curl_multi_run( self, curl_multi->multi, &running );
  // multi run
  while (1) {
    curl_multi_perform(curl_multi->multi, &running);
     // procura pelo easy ja terminado
    if(multi_finished_easy(curl_multi->multi, curl_easy->curl)) {
      rb_multi_remove_handle(self, rb_easy);
      break;
    }
  }
  // end multi run
  
  running = 0;
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

  return Qnil;
}


/*
 * rb_new
 */
static VALUE rb_new(int argc, VALUE *argv, VALUE klass) {
  CurlMulti *curl_multi;
  VALUE     rb_multi;

  curl_multi = ALLOC(CurlMulti);  
  curl_multi->multi = curl_multi_init();

  rb_multi = Data_Wrap_Struct(rb_cMulti, 0, dealloc, curl_multi);

  // pass arguments to ruby object
  rb_obj_call_init(rb_multi, argc, argv);

  return rb_multi;
}


/*
 * Ruby interface
 */
void init_rubycurl_multi() {
  rb_cMulti = rb_define_class_under(rb_mRubyCurl, "Multi", rb_cObject);

  rb_define_singleton_method(rb_cMulti, "new", rb_new, -1);

  rb_define_private_method(rb_cMulti, "multi_add_handle",    rb_multi_add_handle,    1);
  rb_define_private_method(rb_cMulti, "multi_remove_handle", rb_multi_remove_handle, 1);

  rb_define_private_method(rb_cMulti, "multi_setopt_long",   rb_multi_setopt_long,   2);

  rb_define_private_method(rb_cMulti, "multi_perform",       multi_perform,       1);
  //rb_define_private_method(rb_cMulti, "multi_cleanup",       multi_cleanup,       0);
  //rb_define_private_method(rb_cMulti, "active_handle_count", active_handle_count, 0);
}
