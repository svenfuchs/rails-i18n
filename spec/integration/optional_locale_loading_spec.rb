# encoding: utf-8

require 'spec_helper'

describe "Rails-i18n" do
  let(:app) do
    RailsI18n::Spec::FakeApp
  end

  context "when locales to load are specified in config" do
    let(:translations) do
      with_de_locale = ->{ I18n.t("helpers.select.prompt") }
      with_ru_locale = ->{ I18n.t("helpers.select.prompt", :locale => :ru) }

      app.run(with_de_locale, with_ru_locale)  do |config|
        config.i18n.default_locale = :de
        config.rails_i18n.load_only = [:ru, :uk]
      end
    end

    it "loads only specified locales" do
      translations.first.should == 'translation missing: de.helpers.select.prompt'
      translations.last.should == 'Выберите: '
    end
  end

  context "when only single locale to load is specified" do
    let(:transliterations) do
      with_uk_locale = ->{ I18n.transliterate 'Рубі!' }
      with_bg_locale = ->{ I18n.transliterate('Рубі!', :locale => :bg) }

      app.run(with_uk_locale, with_bg_locale)  do |config|
        config.i18n.default_locale = :uk
        config.rails_i18n.load_only = :uk
      end
    end

    it "accepts such configuration" do
      transliterations.first.should == 'Rubi!'
      transliterations.last.should == '????!'
    end
  end
end