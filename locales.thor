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

  desc 'normalize_from_rails', 'Download latest Rails locale files, normalize them, and merge into a single file.'
  def normalize_from_rails
    curr_dir = File.expand_path(File.dirname(__FILE__))
    rails_locale_dir = File.expand_path(File.join(curr_dir, 'rails', 'rails'))
    normalized_dir = File.join(rails_locale_dir, 'normalized')

    puts "Fetching latest Rails locale files to #{rails_locale_dir}... \n\n"
    system <<-BASH
      curl -Lo '#{rails_locale_dir}/action_view.yml' https://raw.githubusercontent.com/rails/rails/8-0-stable/actionview/lib/action_view/locale/en.yml
      curl -Lo '#{rails_locale_dir}/active_model.yml' https://raw.githubusercontent.com/rails/rails/8-0-stable/activemodel/lib/active_model/locale/en.yml
      curl -Lo '#{rails_locale_dir}/active_record.yml' https://raw.githubusercontent.com/rails/rails/8-0-stable/activerecord/lib/active_record/locale/en.yml
      curl -Lo '#{rails_locale_dir}/active_support.yml' https://raw.githubusercontent.com/rails/rails/8-0-stable/activesupport/lib/active_support/locale/en.yml
    BASH
    puts "\nDownload complete.\n\n"

    merged_content = {}
    Dir.glob("#{rails_locale_dir}/*.yml").each do |filename|
      puts "Normalizing #{filename}..."

      content = YAML.load_file(filename)
      normalized_content = Normalize.deep_sort(content)

      output_filename = File.join(normalized_dir, File.basename(filename))
      File.write(output_filename, normalized_content.to_yaml(line_width: -1))
      puts "Normalized file saved to #{output_filename}"

      merged_content.deep_merge!(normalized_content)
    end

    puts "\nAll downloaded files normalized and saved."

    puts "\nNormalizing merged content..."
    normalized_merged_content = Normalize.deep_sort(merged_content)
    merged_filename = File.join(normalized_dir, 'merged.yml')
    File.write(merged_filename, normalized_merged_content.to_yaml(line_width: -1))

    puts "Merged file saved to #{merged_filename}."
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

  desc 'check_line_count', 'Returns a list of locale files with their line count, so that we can identify anomalies'
  def check_line_count
    for file, count in CheckLocales.line_counts() do
      puts "#{file}: #{count} lines"
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
