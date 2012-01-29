ENV["RAILS_ENV"] = "test"

require 'rspec'
require 'i18n-spec'
require 'support/fake_app'

RSpec.configure do |config|
  config.mock_with :rspec
  config.fail_fast = true
end