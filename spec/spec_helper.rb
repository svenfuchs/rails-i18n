# Configure Rails envinronment
ENV["RAILS_ENV"] = "test"

require "action_controller/railtie"
require "rspec/rails"
require "will_paginate"
require "rails_i18n"
require "fake_app"
require "i18n-spec"

# Configure RSpec
RSpec.configure do |config|
  require 'rspec/expectations'
  config.include RSpec::Matchers
  config.mock_with :rspec
end
