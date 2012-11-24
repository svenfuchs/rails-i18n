# encoding: utf-8

Gem::Specification.new do |s|
  s.name         = "rails-i18n"
  s.version      = '0.7.1'
  s.authors      = ["Rails I18n Group"]
  s.email        = "rails-i18n@googlegroups.com"
  s.homepage     = "http://github.com/svenfuchs/rails-i18n"
  s.summary      = "Common locale data and translations for Rails i18n."
  s.description  = "A set of common locale data and translations to internationalize and/or localize your Rails applications."

  s.files        = Dir.glob("lib/**/*") + Dir.glob("rails/locale/*") +
                   Dir.glob("rails/pluralization/*") + Dir.glob("rails/transliteration/*") +
                   %w(README.md CHANGELOG.md MIT-LICENSE.txt)
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.rubyforge_project = '[none]'
  s.required_rubygems_version = '>= 1.3.5'

  s.add_dependency('i18n', '~> 0.5')
  s.add_development_dependency "rails", "= 3.2.9"
  s.add_development_dependency "rspec-rails", "= 2.12.0"
  s.add_development_dependency "i18n-spec", "= 0.3.0"
  s.add_development_dependency "spork", "= 1.0.0rc3"
end
