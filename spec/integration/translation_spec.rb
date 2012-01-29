# encoding: utf-8

require 'spec_helper'

describe "Translation" do

  let(:app) do
    RailsI18n::Spec::FakeApp
  end

  context "when default locale is not English" do
    let(:translation) do
      app.run ->{ I18n.t("helpers.select.prompt") } do |config|
        config.i18n.default_locale = :de
      end
    end

    it "is available" do
      translation.should == "Bitte wählen"
    end
  end
end