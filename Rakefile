require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

task :default => :test
task :build_and_install, [:version] do |t, args|
  sh "gem build coingecko_ruby.gemspec"
  sh "gem install ./coingecko_ruby-#{args.version}.gem"
end
