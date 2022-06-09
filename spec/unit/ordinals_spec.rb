require 'spec_helper'
require 'rails_i18n/railtie'

describe 'Ordinals for' do
  # Mock Rails app in order to trigger the Railtie
  let(:app) { double :app, config: config }
  let(:config) { double :config, eager_load_namespaces: [], i18n: I18n }

  before do
    I18n.available_locales = %w[fr en fr-CA fr-CH fr-FR]

    RailsI18n::Railtie.initializers.each { |init| init.run(app) }
    I18n.backend.reload!
  end

  describe 'French' do
    it 'uses the custom rules' do
      %i[fr fr-CA fr-CH fr-FR].each do |locale|
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

  describe 'Spanish' do
    it 'uses the custom rules' do
      %i[es es-419 es-AR es-CL es-CO es-CR es-EC es-ES es-MX es-NI es-PA es-PE es-US es-VE].each do |locale|
        I18n.with_locale(locale) do
          ActiveSupport::Inflector.ordinalize(1).should == "1º"
          ActiveSupport::Inflector.ordinalize(2).should == "2º"
          ActiveSupport::Inflector.ordinalize(3).should == "3º"
        end
      end
    end
  end

  describe 'Portuguese' do
    it 'uses the custom rules' do
      %i[pt pt-BR].each do |locale|
        I18n.with_locale(locale) do
          ActiveSupport::Inflector.ordinalize(1).should == "1º"
          ActiveSupport::Inflector.ordinalize(2).should == "2º"
          ActiveSupport::Inflector.ordinalize(3).should == "3º"
        end
      end
    end
  end

  describe 'German' do
    it 'uses the custom rules' do


      %i[de-AT de-CH de-DE de].each do |locale|
        I18n.with_locale(locale) do
          ActiveSupport::Inflector.ordinalize(1).should == "1."
          ActiveSupport::Inflector.ordinalize(2).should == "2."
          ActiveSupport::Inflector.ordinalize(3).should == "3."
        end
      end
    end
  end
end
