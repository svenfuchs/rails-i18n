require 'support/traverse_path'
require 'support/ruby_content'

module RailsI18n
  module Spec
    class PluralizationFile
      include TraversePath
      include RubyContent

      def initialize(filepath)
        @filepath = filepath
      end
    end
  end
end