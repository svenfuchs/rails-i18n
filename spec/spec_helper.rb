ENV["RAILS_ENV"] = "test"

require 'rspec'
require 'i18n-spec'
require 'i18n/core_ext/hash'
require 'active_support/core_ext/kernel/reporting'
require 'support/fake_app'

RSpec.configure do |config|
  config.mock_with :rspec
  config.fail_fast = true
end