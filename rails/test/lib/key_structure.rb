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
    def check(locale)
      missing_keys = []
      broken_keys = []

      init_backend(locale)

      I18n.locale = locale.to_sym
      translations = flatten_hash(I18n.backend.translations[:'en'])
      translations.keys.sort.each do |key|
        begin
          case key
          when /^date\.formats\.(\w+)/
            I18n.l Date.today, :format => $1.to_sym, :raise => true
          when /^time\.formats\.(\w+)/
            I18n.l Time.now, :format => $1.to_sym, :raise => true
          else
            I18n.t key, :raise => true
          end
        rescue I18n::MissingTranslationData
          missing_keys << key
        rescue Exception
          broken_keys << key
        end
      end

      return missing_keys, broken_keys
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

      def init_backend(locale)
        I18n.load_path = []
        I18n.reload!

        I18n.load_path += Dir[File.dirname(__FILE__) + "/../../rails3/*.yml"]

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
