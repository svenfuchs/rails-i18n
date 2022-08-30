##
# A utility class to check locale files with locales.thor
# and rspec
# Needs to inherit from Thor: https://github.com/rails/thor/wiki/Invocations

class CheckLocales < Thor

  @path_to_locales = 'rails/locale'
  @path_to_pluralizations = 'rails/pluralization'
  @en_line_count = File.open(@path_to_locales+'/en.yml').readlines().size

  def self.list_locales
    Dir.chdir(@path_to_locales)
    locale_files = Dir.glob('**/*.yml')
    locales = locale_files.map{ |f| File.basename(f, '.yml') }
    Dir.chdir('../..') # reset working directory
    return locales.sort
  end
  
  # Returns the number of available locales
  def self.count
    return self.list_locales.count
  end

  def self.list_pluralizations
    Dir.chdir(@path_to_pluralizations)
    pluralization_files = Dir.glob('*.rb')
    pluralizations = pluralization_files.map{ |f| File.basename(f, '.rb') }
    Dir.chdir('../..') # reset working directory
    return pluralizations.sort
  end

  # Returns pluralizations that do not have a locale file
  def self.orphan_pluralizations
    return self.list_pluralizations.difference(self.list_locales)
  end

  # Returns locales that do not have a pluralization file
  def self.orphan_locales
    return self.list_locales.difference(self.list_pluralizations)
  end
  
  # Returns the line count of the en.yml file
  def self.en_line_count
    @en_line_count
  end

  # Helps identify anomalies in the locale.yml files
  # returns a hash of locale files with their line count
  # in the format 'locale_file' : line count
  # {'locale1.yml': 100, 'locale2.yml': 111 ... }
  def self.line_counts
    file_line_count = {}
    Dir.chdir(@path_to_locales)
    locale_files = Dir.glob('**/*.yml')
    for f in locale_files do
      line_count = File.open(f).readlines().size
      file_line_count[f] = line_count
    end
    return file_line_count
  end
end

