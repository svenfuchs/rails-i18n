require "json"

module RailsI18n
  module Spec
    module RubyContent
      def content
        @content ||= eval(File.read(@filepath), TOPLEVEL_BINDING, @filepath)
      end
    end
  end
end
