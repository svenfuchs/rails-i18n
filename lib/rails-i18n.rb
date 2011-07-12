ActiveSupport.on_load(:i18n) do
  I18n.load_path << Dir[File.join(File.expand_path(File.dirname(__FILE__) + '/../rails/locale'), '*.{rb,yml}')]
  I18n.load_path.flatten!
end
