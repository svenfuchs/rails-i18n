module RailsI18n
  @@example_groups = []
  mattr_accessor :example_groups
end

require File.expand_path(File.dirname(__FILE__) + '/../../config/examples.rb')
