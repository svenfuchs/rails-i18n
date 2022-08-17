##
# A utility class to check locale files with locales.thor
# and rspec
# Needs to inherit from Thor: https://github.com/rails/thor/wiki/Invocations

class CheckLocales < Thor
  def self.list_locales
    path_to_locales = 'rails/locale'
    Dir.chdir(path_to_locales)
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
    path_to_pluralizations = 'rails/pluralization'
    Dir.chdir(path_to_pluralizations)
    pluralization_files = Dir.glob('*.rb')
    pluralizations = pluralization_files.map{ |f| File.basename(f, '.rb') }
    Dir.chdir('../..') # reset working directory
    return pluralizations.sort
  end

  # Returns pluralizations that do not have a locale file
  def self.orphaned_pluralizations
    return self.list_pluralizations.difference(self.list_locales)
  end
end

