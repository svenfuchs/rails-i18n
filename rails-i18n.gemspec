Gem::Specification.new do |s|
  s.name         = "rails-i18n"
  s.version      = '7.0.1'
  s.authors      = ["Rails I18n Group"]
  s.email        = "rails-i18n@googlegroups.com"
  s.homepage     = "http://github.com/svenfuchs/rails-i18n"
  s.summary      = "Common locale data and translations for Rails i18n."
  s.description  = "A set of common locale data and translations to internationalize and/or localize your Rails applications."
  s.license      = 'MIT'

  s.files        = Dir.glob("lib/**/*") + Dir.glob("rails/locale/*") +
                   Dir.glob("rails/pluralization/*") + Dir.glob("rails/transliteration/*") +
                   %w(README.md CHANGELOG.md MIT-LICENSE.txt)
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.required_rubygems_version = '>= 1.8.11'

  s.add_runtime_dependency('i18n', '>= 0.7', '< 2')
  s.add_runtime_dependency('railties', '>= 6.0.0', '< 8')
  s.add_development_dependency "rspec-rails", "~> 3.7"
  s.add_development_dependency "i18n-spec", "~> 0.6.0"
  s.add_development_dependency 'i18n-tasks', '~> 0.9.20'
end
