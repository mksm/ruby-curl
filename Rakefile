require "spec"
require "spec/rake/spectask"

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name          = "ruby-curl"
    gem.authors       = ["Ricardo de Amorim"]
    gem.email         = ["ricardo.amorim@mapabrasil.info"]
    gem.summary       = "Yet another binding for cURL"
    gem.description   = "Yet another binding for cURL"
    gem.homepage      = "https://github.com/mksm/ruby-curl"
    gem.files         = FileList['{ext,lib,spec}/**/*.{rb,c,h}', '[A-Z]*']
    gem.extensions    = FileList['ext/**/extconf.rb']
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rake/extensiontask'
Rake::ExtensionTask.new('rb_curl')

CLEAN.include 'lib/**/*.so'

desc "Run all the tests"
task :default => :spec
