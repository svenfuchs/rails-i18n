# encoding: utf-8

require 'spec_helper'

describe "Transliteration" do

  let(:app) do
    RailsI18n::Spec::FakeApp
  end

  context "when default locale contains non-ASCII symbols" do
    let(:transliteration) do
      app.run ->{ I18n.transliterate 'съществуват' } do |config|
        config.i18n.default_locale = :bg
      end
    end

    it "works" do
      transliteration.should == "sashtestvuvat"
    end
  end
end