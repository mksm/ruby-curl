require "spec"
require "spec/rake/spectask"

require 'rake/extensiontask'
Rake::ExtensionTask.new('rb_curl')

CLEAN.include 'lib/**/*.so'

desc "Run all the tests"
task :default => :spec
