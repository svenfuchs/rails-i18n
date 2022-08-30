##
# A utility class to check locale files with locales.thor
# and rspec
# Needs to inherit from Thor: https://github.com/rails/thor/wiki/Invocations

class CheckLocales < Thor

  @path_to_locales = 'rails/locale'
  @path_to_pluralizations = 'rails/pluralization'

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

  # a heuristic check of the locales
  # returns a hash of locale files with a line count that does not match en.yml
  # in the format 'locale_file' : line count
  # {'problem_locale1.yml': 100, 'problem_locale2.yml': 111 ... }
  def self.check_line_count
    en_line_count = File.open(@path_to_locales+'/en.yml').readlines().size
    wrong_line_count = {}
    Dir.chdir(@path_to_locales)
    locale_files = Dir.glob('**/*.yml')
    for f in locale_files do
      line_count = File.open(f).readlines().size
      if line_count != en_line_count
        wrong_line_count[f] = line_count
      end
    end
    return wrong_line_count
  end
end

