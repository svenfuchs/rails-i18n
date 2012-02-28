require 'rails'

module RailsI18n
  class Railtie < ::Rails::Railtie #:nodoc:
    initializer 'rails-i18n' do
      RailsI18n::Railtie.instance_eval do
        add('rails/locale/*.yml')
        add('rails/pluralization/*.rb')
        add('rails/transliteration/*.{rb,yml}')

        init_pluralization_module
      end
    end

    protected

    def self.add(pattern)
      files = Dir[File.join(File.dirname(__FILE__), '../..', pattern)]
      I18n.load_path.concat(files)
    end

    def self.init_pluralization_module
      I18n.backend.class.send(:include, I18n::Backend::Pluralization)
    end
  end
end
