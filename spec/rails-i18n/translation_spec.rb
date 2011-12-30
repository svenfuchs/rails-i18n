# coding: utf-8

require 'spec_helper'

describe "translation" do
  it "should give translations for rails" do
    I18n.t("helpers.select.prompt").should == "Please select"
  end
end
