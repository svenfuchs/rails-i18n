require 'rake'
require 'rake/testtask'
require 'rbconfig'
require 'yaml'

task :test => 'test:all'

namespace :test do
  desc 'Check formality of all locale files.'
  task :all do
    ruby = File.join(*RbConfig::CONFIG.values_at('bindir', 'RUBY_INSTALL_NAME'))
    system(ruby, File.dirname(__FILE__) + '/rails/test/structure.rb')
  end
end

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new("spec:unit") do |spec|
  spec.pattern = 'spec/unit/**/*_spec.rb'
end

RSpec::Core::RakeTask.new("spec:integration") do |spec|
  spec.pattern = 'spec/integration/**/*_spec.rb'
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

require 'i18n-spec/tasks' # needs to be loaded after rspec

task :default => :spec