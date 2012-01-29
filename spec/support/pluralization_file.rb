module RailsI18n
  module Spec
    class PluralizationFile
      def initialize(filepath)
        @filepath = filepath
      end

      def content
        @content ||= eval(IO.read(@filepath), TOPLEVEL_BINDING)
      end

      # @return [Object, nil] Nil if path can't be traversed with the given key
      # sequence, unless return Object at last key (it also can be nil)
      def traverse_path(options)
        keys = options[:keys] || []
        where = options[:where] || content

        if (key = keys.shift) && where.is_a?(Hash)
          value = where[key]
          if keys.empty?
            value
          else
            traverse_path(:keys => keys, :where => value) if value
          end
        end
      end
    end
  end
end