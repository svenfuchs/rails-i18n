module RailsI18n
  module Spec
    module RubyContent
      def content
        @content ||= silence_warnings do
          eval(IO.read(@filepath), TOPLEVEL_BINDING).deep_symbolize_keys
        end
      end
    end
  end
end