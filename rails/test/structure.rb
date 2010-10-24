require File.dirname(__FILE__) + '/lib/key_structure.rb'

if ARGV.first
  locales = [ARGV.first]
else
  locales = []
  Dir.glob(File.dirname(__FILE__) + '/../locale/*.{rb,yml}') do |filename|
    if md = filename.match(/([\w\-]+)\.(rb|yml)$/)
      locales << md[1]
    end
  end
end

locales.each do |locale|
  missing_keys = {}
  [2, 3].each do |version|
    missing_keys[version] = KeyStructure.check(locale, version)
  end
  if missing_keys[2].empty? && missing_keys[3].empty?
    puts "[#{locale}] The structure is good for Rails 2 and 3."
  else
    [2, 3].each do |version|
      unless missing_keys[version].empty?
        if ARGV.first
          puts "[#{locale}] The following keys are missing for Rails #{version}."
          missing_keys[version].each do |key|
            puts "  " + key
          end
        else
          puts "[#{locale}] Some keys are missing for Rails #{version}."
        end
      end
    end
  end
end
