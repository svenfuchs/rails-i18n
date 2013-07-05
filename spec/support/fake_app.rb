require 'spork'

module RailsI18n
  module Spec
    module FakeApp
      # Initialize Rails app in a clean environment.
      # @param tests [Proc] which have to be run after app was initialized
      # @return [Array, Object] single result if one test was passed given,
      #   otherwise returns an array of results
      def self.run(*tests)
        forker = Spork::Forker.new do
          require 'rails-i18n'
          require 'action_controller/railtie'

          app = Class.new(Rails::Application)
          app.config.active_support.deprecation = :log
          app.config.eager_load = false

          yield(app.config) if block_given?
          app.initialize!

          results = tests.map &:call
          results.size == 1 ? results.first : results
        end
        forker.result
      end
    end
  end
end
