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
      missing_pluralizations = []

      init_backend(locale)

      I18n.locale = locale.to_sym
      translations = flatten_hash(I18n.backend.translations[:'default'])
      pluralizations = find_pluralizations(I18n.backend.translations[:'default'])
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

          begin
            if pluralizations.has_key?(key)
              I18n.t key, :count => 0, :raise => true
              I18n.t key, :count => 1, :raise => true
              I18n.t key, :count => 2, :raise => true
              I18n.t key, :count => 3, :raise => true
              I18n.t key, :count => 5, :raise => true
              I18n.t key, :count => 6, :raise => true
              I18n.t key, :count => 10, :raise => true
              I18n.t key, :count => 11, :raise => true
              I18n.t key, :count => 100, :raise => true
              I18n.t key, :count => 1000000, :raise => true
              I18n.t key, :count => 10.2, :raise => true
            end
          rescue Exception
            missing_pluralizations << key
          end
        rescue I18n::MissingTranslationData
          missing_keys << key
        rescue Exception
          broken_keys << key
        end
      end

      return missing_keys, broken_keys, missing_pluralizations
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

      def find_pluralizations(data, prefix = '', result = {})
        data.each do |key, value|
          current_prefix = prefix.empty? ? key.to_s : "#{prefix}.#{key}"

          if value.is_a?(Hash)
            if pluralization_data?(value)
              result[current_prefix] = value
            else
              find_pluralizations(value, current_prefix, result)
            end
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

        pluralization = File.dirname(__FILE__) + "/../../pluralization/#{locale}.rb"
        I18n.load_path += [pluralization] if File.exist?(pluralization)
        I18n.backend.class.send(:include, I18n::Backend::Pluralization)

        I18n.backend.init_translations
      end
  end
end
