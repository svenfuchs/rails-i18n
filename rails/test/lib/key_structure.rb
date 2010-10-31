require 'rubygems'
require 'i18n'

module I18n
  module Backend
    class Simple
      public :translations, :init_translations
    end
  end
end

class KeyStructure
  PLURALIZATION_KEYS = ['zero', 'one', 'two', 'few', 'many', 'other']

  class << self
    def check(locale, version)
      missing_keys = []

      init_backend(locale, version)

      I18n.locale = locale.to_sym
      translations = flatten_hash(I18n.backend.translations[:'en'])
      translations.keys.sort.each do |key|
        begin
          I18n.t key, :raise => true
        rescue
          missing_keys << key
        end
      end

      missing_keys
    end

    private
      def flatten_hash(data, prefix = '', result = {})
        data.each do |key, value|
          current_prefix = prefix.empty? ? key.to_s : "#{prefix}.#{key}"

          if !value.is_a?(Hash) || pluralization_data?(value)
            result[current_prefix] = value
          else
            flatten_hash(value, current_prefix, result)
          end
        end

        result
      end

      def pluralization_data?(data)
        keys = data.keys.map(&:to_s)
        keys.all? {|k| PLURALIZATION_KEYS.include?(k) }
      end

      def init_backend(locale, version)
        I18n.load_path = []
        I18n.reload!

        case version.to_i
        when 2
          I18n.load_path += Dir[File.dirname(__FILE__) + "/../../rails/*.yml"]
        when 3
          I18n.load_path += Dir[File.dirname(__FILE__) + "/../../rails3/*.yml"]
        end

        path = File.dirname(__FILE__) + "/../../locale/#{locale}.rb"

        unless File.exist?(path)
          path = File.dirname(__FILE__) + "/../../locale/#{locale}.yml"
        end

        unless File.exist?(path)
          raise "No locale file exist for :#{locale}."
        end

        I18n.load_path += [path]
        I18n.backend.init_translations
      end
  end
end
