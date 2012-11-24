ENV["RAILS_ENV"] = "test"

require 'i18n-spec'
require 'rails_i18n/unicode'
require 'i18n/core_ext/hash'
require 'active_support/core_ext/kernel/reporting'
require 'socket'
require 'support/fake_app'

RSpec.configure do |config|
  config.mock_with :rspec
  config.fail_fast = true
end