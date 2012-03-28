# encoding: utf-8

require 'spec_helper'

describe "Rails-i18n" do
  let(:app) do
    RailsI18n::Spec::FakeApp
  end

  context "when i18n.available_locales are specified in config" do
    let(:i18n_results) do
      de_translate = lambda { I18n.t "helpers.select.prompt", :locale => :de }
      ru_translate = lambda { I18n.t "helpers.select.prompt", :locale => :ru }
      uk_transliterate = lambda { I18n.transliterate 'Рубі!', :locale => :uk }
      bg_transliterate = lambda { I18n.transliterate 'Рубі!', :locale => :bg }

      app.run(de_translate, ru_translate, uk_transliterate, bg_transliterate)  do |config|
        config.i18n.available_locales = [:ru, :uk]
      end
    end

    it "loads only specified locales" do
      de_translate, ru_translate, uk_transliterate, bg_transliterate = *i18n_results

      de_translate.should == 'translation missing: de.helpers.select.prompt'
      ru_translate.should == 'Выберите: '
      uk_transliterate.should == 'Rubi!'
      bg_transliterate.should == '????!'
    end
  end

  context "when single locale is assigned to i18n.available_locales" do
    let(:translations) do
      fr = lambda { I18n.t "helpers.select.prompt" }
      it = lambda { I18n.t "helpers.select.prompt", :locale => :it }

      app.run(fr, it)  do |config|
        config.i18n.default_locale = 'fr'
        config.i18n.available_locales = 'fr'
      end
    end

    it "loads only this locale" do
      fr_translation, it_translation = *translations

      fr_translation.should == 'Veuillez sélectionner'
      it_translation.should == 'translation missing: it.helpers.select.prompt'
    end
  end
end