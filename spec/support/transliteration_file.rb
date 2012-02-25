require 'support/traverse_path'
require 'support/ruby_content'
require 'yaml'

module RailsI18n
  module Spec
    class TransliterationFile
      include TraversePath

      def self.make(filepath)
        raise "Transliteration file doesn't exist!" unless filepath
        case File.extname(filepath)
          when '.rb' then RubyTransliterationFile.new(filepath)
          when '.yml' then YAMLTransliterationFile.new(filepath)
        end
      end

      def initialize(filepath)
        @filepath = filepath
      end

      def rule
        @rule ||= begin
          locale = @filepath.match(/([\w-]+)\.[^\.]+$/) { |md| md[1] }
          traverse_path(locale.to_sym, :i18n, :transliterate, :rule)
        end
      end
    end

    class RubyTransliterationFile < TransliterationFile
      include RubyContent

      def transliterate(string)
        rule.call(string)
      end
    end

    class YAMLTransliterationFile < TransliterationFile
      def content
        @content ||= YAML.load_file(@filepath).deep_symbolize_keys
      end

      def transliterate(string)
        string.gsub(/./) { |char| rule[char.to_sym] }
      end
    end
  end
end