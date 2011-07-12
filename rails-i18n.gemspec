# encoding: utf-8

Gem::Specification.new do |s|
  s.name         = "rails-i18n"
  s.version      = '0.6'
  s.authors      = ["Rails I18n Group"]
  s.email        = "rails-i18n@googlegroups.com"
  s.homepage     = "http://github.com/svenfuchs/rails-i18n"
  s.summary      = "New wave Internationalization support for Ruby on Rails"
  s.description  = "New wave Internationalization support for Ruby on Rails."

  s.files        = Dir.glob("rails/locale/*") + %w(README.md MIT-LICENSE.txt lib/rails-i18n.rb)
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.rubyforge_project = '[none]'
  s.required_rubygems_version = '>= 1.3.5'

  s.add_dependency('activesupport', '~> 3')
end
