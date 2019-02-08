require "json"

module RailsI18n
  module Spec
    module RubyContent
      def content
        @content ||= eval(IO.read(@filepath), TOPLEVEL_BINDING)
      end
    end
  end
end
