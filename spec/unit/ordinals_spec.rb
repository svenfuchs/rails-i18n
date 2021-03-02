require 'spec_helper'
require 'rails_i18n/railtie'

describe 'Ordinals for' do
  # Mock Rails app in order to trigger the Railtie
  let(:app) { double :app, config: config }
  let(:config) { double :config, eager_load_namespaces: [], i18n: I18n }

  before do |example|
    RailsI18n::Railtie.initializers.each { |init| init.run(app) }
    I18n.backend.reload!
    I18n.locale = example.metadata[:locale]
  end

  describe 'French', locale: :fr do
    it 'uses the custom rules' do
      ActiveSupport::Inflector.ordinalize(1).should == "1er"
      ActiveSupport::Inflector.ordinalize(2).should == "2e"
      ActiveSupport::Inflector.ordinalize(3).should == "3e"
    end
  end

  describe 'English', locale: :en do
    it 'uses the default rules' do
      ActiveSupport::Inflector.ordinalize(1).should == "1st"
      ActiveSupport::Inflector.ordinalize(2).should == "2nd"
      ActiveSupport::Inflector.ordinalize(3).should == "3rd"
    end
  end
end
