# encoding: utf-8

require 'spec_helper'

describe "Transliteration" do

  let(:app) do
    RailsI18n::Spec::FakeApp
  end

  context "when default locale contains non-ASCII symbols" do
    let(:transliteration) do
      app.run lambda { I18n.transliterate('Руби!') } do |config|
        config.i18n.default_locale = :ru
      end
    end

    it "works" do
      transliteration.should == "Rubi!"
    end
  end
end