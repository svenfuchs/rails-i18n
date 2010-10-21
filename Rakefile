require 'rake'
require 'rake/testtask'

require 'rbconfig'

desc 'Run all tests by default'
task :default => :test
task :test => 'test:all'

namespace :test do
  desc 'Check formality of all locale files.'
  task :all do
    ruby = File.join(*RbConfig::CONFIG.values_at('bindir', 'RUBY_INSTALL_NAME'))
    system(ruby, File.dirname(__FILE__) + '/rails/test/structure.rb')
  end
end
