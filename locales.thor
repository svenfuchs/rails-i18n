require File.dirname(__FILE__) + '/rails/test/lib/key_structure.rb'
require File.dirname(__FILE__) + '/rails/test/lib/normalize.rb'
require File.dirname(__FILE__) + '/rails/test/lib/check_locales.rb'
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/lib') unless $LOAD_PATH.include?(File.dirname(__FILE__) + '/lib')

class Locales < Thor
  desc 'test_all', 'Check formality of all locale files.'
  def test_all
    Dir.glob(File.dirname(__FILE__) + '/rails/locale/*.{rb,yml}') do |filename|
      if md = filename.match(/([\w\-]+)\.(rb|yml)$/)
        locale = md[1]
        missing_keys, broken_keys, missing_pluralizations = KeyStructure.check(locale)
        unless missing_keys.empty?
          puts "[#{locale}] Some keys are missing."
        end
        unless broken_keys.empty?
          puts "[#{locale}] Some keys have broken data."
        end
        unless missing_pluralizations.empty?
          puts "[#{locale}] Some keys have missing pluralizations."
        end
      end
    end
  end

  desc 'test LOCALE', 'Check formality of a locale file.'
  def test(locale)
    good = true

    missing_keys, broken_keys, missing_pluralizations = KeyStructure.check(locale)
    unless missing_keys.empty?
      puts "The following keys are missing."
      missing_keys.each do |key|
        puts "  " + key
      end
      good = false
    end

    unless broken_keys.empty?
      puts "The following keys have broken data."
      broken_keys.uniq.each do |key|
        puts "  " + key
      end
      good = false
    end

    unless missing_pluralizations.empty?
      puts "The following keys have missing pluralizations."
      missing_pluralizations.uniq.each do |key|
        puts "  " + key
      end
      good = false
    end

    puts "The structure is good." if good
  end

  # Sorts all the keys alphabetically
  # Ensures that the quoting is the simplest
  # Ensures that the line break width is respected
  desc 'normalize LOCALE', 'Normalize locale file.'
  def normalize(locale)
    Dir.glob(format('%s/rails/locale/%s.{rb,yml}', File.dirname(__FILE__), locale)) do |filename|
      h = YAML.load_file(filename)
      File.write(filename, Normalize.deep_sort(h).to_yaml)
    end
  end

  desc 'normalize_all', 'Normalize all locale files.'
  def normalize_all
    Dir.glob(format('%s/rails/locale/*.{rb,yml}', File.dirname(__FILE__))) do |filename|
      h = YAML.load_file(filename)
      File.write(filename, Normalize.deep_sort(h).to_yaml)
    end
  end

  desc 'list', 'List locale names.'
  def list
    puts CheckLocales.list_locales.join(', ')
  end

  desc 'count_all', 'Returns the number of available locales'
  def count_all
    puts CheckLocales.count
  end

  desc 'complete', 'List complete locales'
  def complete
    puts self.complete_locales.join(', ')
  end

  desc 'complete_count', 'Returns the number of complete locales'
  def complete_count
    puts self.complete_locales.count
  end

  desc 'incomplete', 'List incomplete locales'
  def incomplete
    puts self.incomplete_locales.join(', ')
  end

  desc 'incomplete_count', 'Returns the number of incomplete locales'
  def incomplete_count
    puts self.incomplete_locales.count
  end

  desc 'orphan_pluralizations', 'Returns pluralizations that do not have a locale file'
  def orphan_pluralizations
    puts CheckLocales.orphan_pluralizations.join(', ')
  end

  desc 'orphan_locales', 'Returns locales that do not have a pluralization file'
  def orphan_locales
    puts CheckLocales.orphan_locales.join(', ')
  end

  desc 'en_line_count', 'the line count of en.yml'
  def en_line_count
    puts CheckLocales.en_line_count
  end

  desc 'check_line_count', 'a heuristic check of the locales. Checks the line count of locale files compared to :en'
  def check_line_count
    wrong_line_count = CheckLocales.check_line_count()
    if !wrong_line_count.empty?
      puts "The following locale files do not have the same lenght as en.yml:"
      for file, count in wrong_line_count do
        puts "#{file}: #{count} lines"
      end
    else
      puts "All locale files have the same length as en.yml"
    end
  end

  private

  desc 'complete_locales', 'List complete locales'
  def complete_locales
    locales = []
    Dir.glob(File.dirname(__FILE__) + '/rails/locale/*.{rb,yml}') do |filename|
      if md = filename.match(/([\w\-]+)\.(rb|yml)$/)
        locale = md[1]
        
        missing_keys, broken_keys, missing_pluralizations = KeyStructure.check(locale)
        if missing_keys.empty? && broken_keys.empty? && missing_pluralizations.empty?
          locales << locale
        end
      end
    end
    return locales.sort
  end

  desc 'incomplete_locales', 'Returns an array of incomplete locales'
  def incomplete_locales
    locales = []
    Dir.glob(File.dirname(__FILE__) + '/rails/locale/*.{rb,yml}') do |filename|
      if md = filename.match(/([\w\-]+)\.(rb|yml)$/)
        locale = md[1]
        
        missing_keys, broken_keys, missing_pluralizations = KeyStructure.check(locale)
        unless missing_keys.empty? && broken_keys.empty? && missing_pluralizations.empty?
          locales << locale
        end
      end
    end
    return locales.sort
  end
  
end
