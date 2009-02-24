require ENV['TM_SUPPORT_PATH'] + '/lib/ui.rb'
require File.join(File.dirname(__FILE__), 'dictionary')
require File.join(File.dirname(__FILE__), 'yaml_waml')

class Hash
  def deep_merge(other)
    # deep_merge by Stefan Rusterholz, see http://www.ruby-forum.com/topic/142809
    merger = proc { |key, v1, v2| Hash === v1 && Hash === v2 ? v1.merge(v2, &merger) : v2 }
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
end

class Translate

  @@project_dir = ENV['TM_PROJECT_DIRECTORY']
  @@t_path_plain = File.join(@@project_dir, 'log', 'translations')
  @@t_path_yaml = File.join(@@project_dir, 'log', 'translations.yml')
  @@original_text = ENV['TM_SELECTED_TEXT']

  def self.execute
    return if @@original_text.nil?

    key = self.get_key
    if key.nil? || key.gsub(/\s/, '').empty?
      print @@original_text
      return
    end

    translation = ENV['TM_SELECTED_TEXT'].gsub(/^\s*("|')|("|')\s*$/, '')
    self.add_plain_translation(key, translation)
    self.add_yaml_translation(key, translation)

    case self.get_type
    when 'html'
      print "<%=#{self.translation_method} '#{key}' %>"
    when 'string'
      print "\#{#{self.translation_method}('#{key}')}"
    else
      print "#{self.translation_method}('#{key}')"
    end
  end

  def self.get_key
    TextMate::UI.request_string :title => 'Key', :prompt => 'Key'
  end

  def self.get_type
    TextMate::UI.request_string :title => 'Type', :prompt => 'html, string, or ruby'
  end

  def self.add_plain_translation(key, text)
    log_file = File.open(@@t_path_plain, 'a+')
    log_file.puts "#{key}: #{text}"
  end

  def self.add_yaml_translation(key, text)
    keys = ['en'] + key.split('.')
    data = { 'en' => {} }
    data.set keys, text
    data = data.deep_merge YAML.load(File.open(@@t_path_yaml, 'r') { |f| f.read }) if File.exists?(@@t_path_yaml)
    File.open(@@t_path_yaml, 'w+') { |f| f.write YAML.dump(data) }
  end

  def self.translation_method
    current_file = ENV['TM_FILEPATH'].gsub(@@project_dir, '')
    translate_cmd = (current_file =~ /^\/app\/(controllers|helpers|views)\//) ? 't' : 'I18n.t'
  end

end
