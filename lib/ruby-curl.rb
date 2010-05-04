$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'rack/utils'
require 'monitor'

require 'rb_curl'

require 'ruby-curl/options'
require 'ruby-curl/info'
require 'ruby-curl/cookie_jar'
require 'ruby-curl/easy'
require 'ruby-curl/multi'
