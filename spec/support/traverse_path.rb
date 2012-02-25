module RailsI18n
  module Spec
    module TraversePath
      # @return [Object, nil] Nil if path can't be traversed with the given key
      # sequence, unless return Object at last key (it also can be nil)
      def traverse_path(*keys)
        keys.inject(content) do |memo, key|
          return nil if memo[key].nil?
          memo[key]
        end
      end
    end
  end
end