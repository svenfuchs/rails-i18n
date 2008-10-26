require File.dirname(__FILE__) + '/lib/key_structure.rb'

locale = ARGV.first || raise("must give a locale as a command line argument")

test = KeyStructure.new locale
test.run
test.output