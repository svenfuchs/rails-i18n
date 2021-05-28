ENV["RAILS_ENV"] = "test"

require 'i18n-spec'
require 'i18n/core_ext/hash'
require 'active_support/core_ext/kernel/reporting'
require 'socket'
require 'unit/matchers/have_missing_particular_pluralization_keys_matcher'
require 'unit/matchers/have_keys_for_restrict_dependent_destroy_matcher'

I18n.enforce_available_locales = false

RSpec.configure do |config|
  config.mock_with :rspec
  config.fail_fast = true
  config.expect_with :rspec do |c|
    c.syntax = :should
  end
end
