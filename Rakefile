require 'bundler/gem_tasks'
require 'rake/testtask'
require "NewsBot/main"

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/*.rb']
  t.verbose = true
end

task :run do
  NewsBot::main
end