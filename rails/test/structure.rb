require File.expand_path('../lib/key_structure.rb', __FILE__)

locale = ARGV.first || raise("must give a locale as a command line argument")

test = KeyStructure.new locale
test.run
test.output