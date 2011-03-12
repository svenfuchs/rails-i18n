require File.dirname(__FILE__) + '/rails/test/lib/key_structure.rb'

class Locales < Thor
  desc 'test_all', 'Check formality of all locale files.'
  def test_all
    Dir.glob(File.dirname(__FILE__) + '/rails/locale/*.{rb,yml}') do |filename|
      if md = filename.match(/([\w\-]+)\.(rb|yml)$/)
        locale = md[1]
        broken_keys = []
        [2, 3].each do |version|
          missing_keys, keys = KeyStructure.check(locale, version)
          broken_keys += keys
          unless missing_keys.empty?
            puts "[#{locale}] Some keys are missing for Rails #{version}."
          end
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
    
    [2, 3].each do |version|
      missing_keys, keys = KeyStructure.check(locale, version)
      broken_keys += keys
      unless missing_keys.empty?
        puts "The following keys are missing for Rails #{version}."
        missing_keys.each do |key|
          puts "  " + key
        end
        good = false
      end
    end

    unless broken_keys.empty?
      puts "The following keys have broken data."
      broken_keys.uniq.each do |key|
        puts "  " + key
      end
      good = false
    end

    puts "The structure is good for Rails 2 and 3." if good
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

  desc 'ready', 'List locales ready for Rails 2 and 3.'
  def ready
    locales = []
    Dir.glob(File.dirname(__FILE__) + '/rails/locale/*.{rb,yml}') do |filename|
      if md = filename.match(/([\w\-]+)\.(rb|yml)$/)
        locale = md[1]
        if [2, 3].all? { |version|
            missing_keys, broken_keys = KeyStructure.check(locale, version)
            missing_keys.empty? && broken_keys.empty? }
          locales << locale
        end
      end
    end
    puts locales.sort.join(', ')
  end

  desc 'ready_for VERSION', 'List locales ready for a VERSION of Rails.'
  def ready_for(version)
    locales = []
    Dir.glob(File.dirname(__FILE__) + '/rails/locale/*.{rb,yml}') do |filename|
      if md = filename.match(/([\w\-]+)\.(rb|yml)$/)
        locale = md[1]
        missing_keys, broken_keys = KeyStructure.check(locale, version)
        if missing_keys.empty? && broken_keys.empty?
          locales << locale
        end
      end
    end
    puts locales.sort.join(', ')
    locales.sort
  end

  desc 'copy_rails3_ready_to FOLDER','Copy rails 3 ready locales to a folder'
  def copy_rails3_ready_to(folder)
    puts "Folder #{folder}"
    ready_for(3).each do |locale|
      if locale=="th"
        cmd = "cp #{File.dirname(__FILE__) + '/rails/locale/' + locale + '.rb'} #{folder}"
      else
        cmd = "cp #{File.dirname(__FILE__) + '/rails/locale/' + locale + '.yml'} #{folder}"
      end
      puts cmd
      system cmd
    end
  end
end
