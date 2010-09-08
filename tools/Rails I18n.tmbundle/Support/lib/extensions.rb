require 'i18n'
require 'yaml'
require 'pstore'
require ENV['TM_BUNDLE_SUPPORT'] + '/lib/extensions/yaml_waml'

# Add a wrapper for using Dialog1, which allows the window to be modal, while keeping context with the activating page
module TextMate
  # Not complete: Dialog1 supports more options than are available here
  module UI
    class << self
      def dialog1(*args)
        d = Dialog1.new(*args)
        begin          
          yield d.results
        rescue StandardError => error
          puts 'Received exception: ' + error
          puts error.backtrace.join("\n")
        end
      end
    end
    
    class Dialog1
      # Dialog1.new(:nib => path, :parameters => params, :defaults => defaults, :options => {:center => false, :modal => false})
      attr_accessor :results
      
      def initialize(*args)
        nib_path, parameters, defaults, options = if args.size > 1
          args
        else
          args = args[0]
          [args[:nib], args[:parameters], args[:defaults], args[:options]]
        end
        
        command = "#{ENV['DIALOG_1']}"
        command << ' --center'         if options[:center]
        command << ' --modal'          if options[:modal]
        command << ' --quiet'          if options[:quiet]
        command << ' --async-window'   if !options[:modal]
        command << " --parameters #{e_sh parameters.to_plist}" if parameters
        command << " --defaults #{e_sh defaults.to_plist}" if defaults
        command << " #{e_sh nib_path}"

        @results = OSX::PropertyList::load `#{command}`
      end
    end
  end
end

module Exceptions
  class DuplicateKey < StandardError; end
end

module I18nExtensions
  # Otherwise a missing translation will come back as a string, and we can't rescue it specifically
  def just_raise_that_exception(*args)
    raise args.first
  end
end

module HashExtensions
  def deep_merge(other)
    # deep_merge by Stefan Rusterholz, see http://www.ruby-forum.com/topic/142809
    merger = proc { |key, v1, v2| (Hash === v1 && Hash === v2) ? v1.merge(v2, &merger) : v2 }
    merge(other, &merger)
  end

  def set(keys, value)
    key = keys.shift
    if keys.empty?
      self[key] = value
    else
      self[key] ||= {}
      self[key].set keys, value
    end
  end
  
  # copy of ruby's to_yaml method, prepending sort.
  # before each so we get an ordered yaml file
  def to_yaml( opts = {} )
    YAML::quick_emit( self, opts ) do |out|
      out.map( taguri, to_yaml_style ) do |map|
        sort.each do |k, v| #<- Adding sort.
          map.add( k, v )
        end
      end
    end
  end
end


class Object
  def blank?
    self.nil? || self == false || (self.is_a?(String) && self.gsub(/\s/, '').empty?)
  end
end

# Interface for getting and setting translations
class YAMLStore  
  attr_accessor :locale, :locale_file_path
  Hash.class_eval { include HashExtensions }
    
  def initialize(locale, file_path)
    I18n.extend(I18nExtensions)
    
    I18n.exception_handler = :just_raise_that_exception # or else it will output a string with missing translation
    
    self.locale = locale
    self.locale_file_path = file_path
    load_locale
  end
  
  def [](key)
    begin
      I18n.translate(key)
    rescue I18n::MissingTranslationData => ex
      return false # key does not exist
    end
  end
  
  def []=(key, value, force = false)
    raise Exceptions::DuplicateKey if self[key] && !force

    base_key = self.locale.to_s
    keys = [base_key] + key.split('.')
    data = { base_key => {} }    
    data.set(keys.dup, value)
    if File.exists?(self.locale_file_path)
      file_content = File.open(self.locale_file_path, 'r') { |f| f.read }
      data = YAML.load(file_content).deep_merge(data) unless file_content.blank?
      File.open(self.locale_file_path, 'w+') { |f| f.write YAML.dump(data) }
    end
    value
  end
  
  private
  
  def load_locale
    I18n.locale = self.locale
    I18n.load_path << self.locale_file_path
  end
end

# Interface for getting and setting bundle preferences
class Preferences 
  attr_accessor :pstore
  
  def initialize(preferences_path)
    self.pstore = PStore.new(File.expand_path(preferences_path))
  end
  
  def [](key)
    value = self.pstore.transaction { self.pstore[key] }
    value || ""
  end
      
  def []=(key, value)
    self.pstore.transaction { self.pstore[key] = value }
    value 
  end
end


