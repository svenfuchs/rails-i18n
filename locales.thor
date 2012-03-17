require File.dirname(__FILE__) + '/rails/test/lib/key_structure.rb'

class Locales < Thor
  desc 'test_all', 'Check formality of all locale files.'
  def test_all
    Dir.glob(File.dirname(__FILE__) + '/rails/locale/*.{rb,yml}') do |filename|
      if md = filename.match(/([\w\-]+)\.(rb|yml)$/)
        locale = md[1]
        broken_keys = []
        missing_keys, keys = KeyStructure.check(locale)
        broken_keys += keys
        unless missing_keys.empty?
          puts "[#{locale}] Some keys are missing."
        end
        unless broken_keys.empty?
          puts "[#{locale}] Some keys have broken data."
        end
      end
    end
  end

  desc 'test LOCALE', 'Check formality of a locale file.'
  def test(locale)
    good = true
    broken_keys = []
    
    missing_keys, keys = KeyStructure.check(locale)
    broken_keys += keys
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

    puts "The structure is good." if good
  end

  desc 'list', 'List locale names.'
  def list
    locales = []
    Dir.glob(File.dirname(__FILE__) + '/rails/locale/*.{rb,yml}') do |filename|
      if md = filename.match(/([\w\-]+)\.(rb|yml)$/)
        locales << md[1]
      end
    end
    puts locales.sort.join(', ')
  end

  desc 'complete', 'List complete locales'
  def complete
    locales = []
    Dir.glob(File.dirname(__FILE__) + '/rails/locale/*.{rb,yml}') do |filename|
      if md = filename.match(/([\w\-]+)\.(rb|yml)$/)
        locale = md[1]
        
        missing_keys, broken_keys = KeyStructure.check(locale)
        if missing_keys.empty? && broken_keys.empty?
          locales << locale
        end
      end
    end
    puts locales.sort.join(', ')
  end
end
