# encoding: utf-8

require 'spec_helper'

describe "Pluralization" do

  let(:app) do
    RailsI18n::Spec::FakeApp
  end

  context "when default locale has special pluralization rule" do
    let(:translation) do
      app.run ->{ I18n.t(:grandmother, :count => 6) } do |config|
        config.i18n.default_locale = :ru
        config.i18n.load_path << 'spec/fixtures/ru.yml'
      end
    end

    it "works" do
      translation.should == "бабушек"
    end
  end

  context "when default locale has 'one-other' pluralization rule" do
    let(:translation) do
      app.run ->{ I18n.t(:retiree, :count => 3) } do |config|
        config.i18n.default_locale = :nl
        config.i18n.load_path << 'spec/fixtures/nl.yml'
      end
    end

    it "works" do
      translation.should == "gepensioneerden"
    end
  end
end