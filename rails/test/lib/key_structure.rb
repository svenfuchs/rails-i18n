$KCODE = 'u'

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
  attr_reader :result
  
  def initialize(locale)
    @locale = locale.to_sym
    init_backend

    @reference = I18n.backend.translations[:'en-US']
    @data = I18n.backend.translations[@locale]
    
    @result = {:bogus => [], :missing => [], :pluralization => []}
    @key_stack = []
  end
  
  def run
    compare :missing, @reference, @data
    compare :bogus, @data, @reference
  end
  
  def output
    [:missing, :bogus, :pluralization].each do |direction|
      next unless result[direction].size > 0
      case direction
      when :pluralization
        puts "\nThere are the following extra pluralization keys for #{@locale.inspect}"
      else
        puts "\nThe following keys seem to be #{direction} for #{@locale.inspect}"
      end
      puts '   ' + result[direction].join("\n   ")
    end
    if result.map{|k, v| v.size == 0}.uniq == [true]
      puts "No inconsistencies found."
    end
    puts "\n"
  end
  
  protected
  
    def compare(direction, reference, data)
      reference.each do |key, value|
        if data.has_key?(key)
          @key_stack << key
          if namespace?(value)
            compare(direction, value, data[key])
          elsif pluralization?(value)
            compare(:pluralization, value, data[key])
          end
          @key_stack.pop
        else
          @result[direction] << current_key(key)
        end
      end
    end
  
    def current_key(key)
      (@key_stack.dup << key).join('.')
    end
    
    def namespace?(hash)
      Hash === hash and !pluralization?(hash)
    end
    
    def pluralization?(hash)
      Hash === hash and hash.has_key?(:one) and hash.has_key?(:other)
    end
  
    def init_backend
      I18n.load_path = %W(
        rails/rails/action_view.yml
        rails/rails/active_record.yml
        rails/rails/active_support.yml
      )
      I18n.load_path += Dir["rails/locale/#{@locale}.{rb,yml}"]
      I18n.backend.init_translations
    end
end
