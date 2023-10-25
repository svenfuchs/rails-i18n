require 'spec_helper'
require 'rails_i18n'

describe 'Ordinals for' do
  # Mock Rails app in order to trigger the Railtie
  let(:app) { double :app, config: config }
  let(:config) { double :config, eager_load_namespaces: [], i18n: I18n, rails_i18n: RailsI18n }

  before do
    I18n.available_locales = %w[fr en fr-CA fr-CH fr-FR gd oc]

    RailsI18n::Railtie.initializers.each { |init| init.run(app) }
    I18n.backend.reload!
  end

  describe 'French' do
    it 'uses the custom rules' do
      %w[fr fr-CA fr-CH fr-FR ].each do |locale|
        I18n.with_locale(locale) do
          ActiveSupport::Inflector.ordinalize(1).should == "1er"
          ActiveSupport::Inflector.ordinalize(2).should == "2e"
          ActiveSupport::Inflector.ordinalize(3).should == "3e"
        end
      end
    end
  end

  describe 'English' do
    it 'uses the default rules' do
      I18n.with_locale(:en) do
        ActiveSupport::Inflector.ordinalize(1).should == "1st"
        ActiveSupport::Inflector.ordinalize(2).should == "2nd"
        ActiveSupport::Inflector.ordinalize(3).should == "3rd"
      end
    end
  end

  describe 'ScottishGaelic' do
    it 'uses the custom rules' do
      I18n.with_locale(:gd) do
        ActiveSupport::Inflector.ordinalize(1).should == "1ᵈ"
        ActiveSupport::Inflector.ordinalize(2).should == "2ⁿᵃ"
        ActiveSupport::Inflector.ordinalize(3).should == "3ˢ"
        ActiveSupport::Inflector.ordinalize(4).should == "4ᵐʰ"
      end
    end
  end
end

  describe 'Occitan' do
    it 'uses the default rules' do
      I18n.with_locale(:oc) do
        ActiveSupport::Inflector.ordinalize(1).should == "1èr"
        ActiveSupport::Inflector.ordinalize(2).should == "2nd"
        ActiveSupport::Inflector.ordinalize(3).should == "3en"
      end
    end
  end
