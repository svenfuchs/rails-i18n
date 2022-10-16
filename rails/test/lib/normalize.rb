require 'active_support'

# Inspired from https://stackoverflow.com/questions/7275952/how-can-i-sort-yaml-files/13368706#13368706
#
# Used to standardize the locale yaml files 
# Sorts all the keys alphabetically
# Ensures that the quoting is the simplest
# Ensures that the line break width is respected
module Normalize
  PLURALIZATION_KEYS = %w(zero one two few many other).freeze
  ACTIVERECORD_KEYS = %w(has_one has_many).freeze
  DATETIME_KEYS = %w(second minute hour day month year).freeze

  class << self
    def deep_sort(object)
      return object unless object.is_a?(Hash)

      hash = RUBY_VERSION >= '1.9' ? Hash.new : ActiveSupport::OrderedHash.new
      object.each { |k, v| hash[k] = deep_sort(v) }

      keys = hash.keys.map(&:to_s)
      sorted = hash.sort do |a, b|
        a_key = a[0].to_s
        b_key = b[0].to_s
        if (keys - PLURALIZATION_KEYS).empty?
          PLURALIZATION_KEYS.index(a_key) <=> PLURALIZATION_KEYS.index(b_key)
        elsif (keys - ACTIVERECORD_KEYS).empty?
          ACTIVERECORD_KEYS.index(a_key) <=> ACTIVERECORD_KEYS.index(b_key)
        elsif (keys - DATETIME_KEYS).empty?
          DATETIME_KEYS.index(a_key) <=> DATETIME_KEYS.index(b_key)
        else
          a_matches = a_key.match(/^(.+)(#{DATETIME_KEYS.join('|')})(.*)$/)
          b_matches = b_key.match(/^(.+)(#{DATETIME_KEYS.join('|')})(.*)$/)
          if a_matches.nil? || b_matches.nil?
            a_key <=> b_key
          else
            s1 = format('%s%s', a_matches[1], DATETIME_KEYS.index(a_matches[2]))
            s2 = format('%s%s', b_matches[1], DATETIME_KEYS.index(b_matches[2]))
            s1 <=> s2
          end
        end
      end

      hash.class[sorted]
    end
  end
end
