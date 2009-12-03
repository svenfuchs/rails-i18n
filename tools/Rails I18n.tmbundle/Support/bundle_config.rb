CONFIG = {}
CONFIG[:locale] = :en
CONFIG[:locale_file_path] = "#{ENV['TM_PROJECT_DIRECTORY']}/config/locales/en.yml"

CONFIG[:bundle_preferences_path] = "~/Library/Preferences/com.macromates.textmate.rails_i18n_translation_helper.pstore"
CONFIG[:project_directory] = ENV['TM_PROJECT_DIRECTORY']
CONFIG[:method_style] = :long   # :long => I18n.translate() and translate()
                                # :short => I18n.t() and t()                                               
CONFIG[:log_changes] = false
CONFIG[:log_file_path] = "#{ENV['TM_PROJECT_DIRECTORY']}/config/locales/en"
