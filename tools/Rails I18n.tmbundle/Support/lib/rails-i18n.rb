require ENV['TM_SUPPORT_PATH'] + '/lib/ui.rb'
require File.join(File.dirname(__FILE__), 'dictionary')
require File.join(File.dirname(__FILE__), 'yaml_waml')
require 'pstore'

class Hash
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
  
  def self.text_search(h, text)
    return nil if h.nil? || text.nil?
    return h.index(text) if h.has_value?(text)
    
    h.each do |key, value|
      if value.class == Hash
        sub_key = text_search(value, text)
        return "#{key}.#{sub_key}" unless sub_key.nil?
      end
    end
    
    return nil
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

PREFS_FILE = "~/Library/Preferences/com.macromates.textmate.rails_i18n.pstore"

class Translate

  @@prefs = PStore.new(File.expand_path(PREFS_FILE))
  @@project_dir = ENV['TM_PROJECT_DIRECTORY']
  @@t_path_plain = File.join(@@project_dir, 'log', 'translations')
  @@t_path_yaml = File.join(@@project_dir, 'log', 'translations.yml')
  @@original_text = ENV['TM_SELECTED_TEXT']
  @@existing_key = false

  def self.execute
    return if @@original_text.nil?

    translation = ENV['TM_SELECTED_TEXT'].gsub(/^\s*("|')|("|')\s*$/, '')

    key = self.get_key(translation)
    if key.blank?
      print @@original_text
      return
    end

    type = self.get_type
    if type.blank?
      print @@original_text
      return
    end

    case type
    when 'html', 'h'
      replacement = "<%=#{self.translation_method} '#{key}' %>"
    when 'string', 's'
      replacement = "\#{#{self.translation_method}('#{key}')}"
    else
      replacement = "#{self.translation_method}('#{key}')"
    end

    if @@existing_key
      print replacement
    elsif self.add_yaml_translation(key, translation)
      self.add_plain_translation(key, translation)
      print replacement
    else
      print @@original_text
    end
  end

  def self.search_for_old_key(translation)
    es_yaml = YAML.load(File.open("#{@@project_dir}/config/locales/es.yml").read)
    tmp_en_yaml = YAML.load(File.open(@@t_path_yaml))
    Hash.text_search(es_yaml["es"], translation) || Hash.text_search(tmp_en_yaml["en"], translation)
  end

  def self.get_key(translation)
    old_key = self.search_for_old_key(translation)
    prompt = old_key.nil? ? 'Key' : 'FOUND Key!'
    
    key = TextMate::UI.request_string :title => 'Key',
                                      :prompt => prompt,
                                      :default => old_key || self.get_pref('last_used_key')
    self.set_pref('last_used_key', key) if !key.blank? && key != old_key
    @@existing_key = (key == old_key && !key.blank?)
    key
  end

  def self.get_type
    type = TextMate::UI.request_string :title => 'Type',
                                       :prompt => 'html (or h), string (or s), or ruby (or r)',
                                       :default => self.get_pref('last_used_type')
    self.set_pref('last_used_type', type) unless type.blank?
    type
  end

  def self.add_plain_translation(key, text)
    log_file = File.open(@@t_path_plain, 'a+')
    log_file.puts "#{key}: #{text}"
  end

  def self.add_yaml_translation(key, text)
    keys = ['en'] + key.split('.')
    data = { 'en' => {} }
    data.set keys.dup, text
    if File.exists?(@@t_path_yaml)
      file_content = File.open(@@t_path_yaml, 'r') { |f| f.read }
      unless file_content.blank?
        parsed_yaml = YAML.load(file_content)
        return false unless self.confirm_if_key_already_in_use(keys, parsed_yaml, text)
        data = parsed_yaml.deep_merge(data)
      end
    end
    File.open(@@t_path_yaml, 'w+') { |f| f.write YAML.dump(data) }
    true
  end

  def self.confirm_if_key_already_in_use(keys, data, text)
    current_value = nil
    begin
      keys.each { |key| data = data[key] }
      current_value = data unless data.blank?
    rescue; end
    confirmed = true
    unless current_value.nil?
      confirmed = TextMate::UI.request_confirmation :button1 => 'Overwrite', :button2 => 'Cancel',
                                                    :title => 'You have already used this translation key',
                                                    :prompt => "This translation key is already in use.\n" +
                                                               "It's current value is:\n" +
                                                               "\t#{current_value}\n" +
                                                               "Would you like to overwrite it with the follow?\n" +
                                                               "\t#{text}"
    end
    confirmed
  end

  def self.translation_method
    current_file = ENV['TM_FILEPATH'].gsub(@@project_dir, '')
    translate_cmd = (current_file =~ /^\/app\/views\//) ? 't' : 'I18n.t'
  end

  def self.get_pref(key)
    pref = @@prefs.transaction { @@prefs[key] }
    (pref || '')
  end

  def self.set_pref(key, value)
    @@prefs.transaction { @@prefs[key] = value }
  end

end
