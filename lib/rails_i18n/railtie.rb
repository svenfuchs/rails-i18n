require 'rails'

module RailsI18n
  class Railtie < ::Rails::Railtie #:nodoc:
    config.rails_i18n = ActiveSupport::OrderedOptions.new
    config.rails_i18n.load_only = []

    initializer 'rails-i18n' do
      RailsI18n::Railtie.instance_eval do |app|
        pattern = pattern_from app.config.rails_i18n.load_only

        add("rails/locale/#{pattern}.yml")
        add("rails/pluralization/#{pattern}.rb")
        add("rails/transliteration/#{pattern}.{rb,yml}")

        init_pluralization_module
      end
    end

    protected

    def self.add(pattern)
      files = Dir[File.join(File.dirname(__FILE__), '../..', pattern)]
      I18n.load_path.concat(files)
    end

    def self.pattern_from(symbol_or_array)
      array = [symbol_or_array].flatten
      array.blank? ? '*' : "{#{array.join ','}}"
    end

    def self.init_pluralization_module
      I18n.backend.class.send(:include, I18n::Backend::Pluralization)
    end
  end
end
