# coding: utf-8

require 'spec_helper'

describe "translation" do
  it "should give translations for rails" do
    require "rails_i18n"
    require "fake_app"
    I18n.t("helpers.select.prompt").should == "Please select"
  end
end


Dir.glob('rails/locale/*.yml') do |locale_file|
  if md = locale_file.match(%r{\Arails/locale/([\w\-]+).yml\z})
    name = md[1]
    if name.in? %w(ar bs cs csb cy dsb fur gsw-CH hr hsb lo lt lv pl rm ro ru sk sl sr sr-Latn)
      describe "a rails-i18n locale file (#{name})" do
        pending
      end
      next
    end
  end

  describe "a rails-i18n locale file" do
    it_behaves_like 'a valid locale file', locale_file
    it { locale_file.should be_a_subset_of('rails/locale/en-US.yml') }
  end
end