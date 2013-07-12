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
          when 'activerecord.errors.messages.restrict_dependent_destroy'
            begin
              I18n.t "#{key}.one", :record => 'dummy', :raise => true
            rescue I18n::MissingTranslationData => e
              missing_keys << e.key
            end
            begin
              I18n.t "#{key}.many", :record => 'dummy', :raise => true
            rescue I18n::MissingTranslationData => e
              missing_keys << e.key
            end
          else
            I18n.t key, :raise => true
          end

          if key != 'activerecord.errors.messages.restrict_dependent_destroy' and pluralizations.has_key?(key)
            [0, 1, 2, 3, 5, 6, 10, 11, 100, 1000000, 10.2].each do |count|
              I18n.t key, :count => count, :raise => true
            end
          end
        rescue I18n::InvalidPluralizationData => e
          missing_pluralizations << key
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

        I18n.load_path += Dir[File.dirname(__FILE__) + "/../../rails4/*.yml"]

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
