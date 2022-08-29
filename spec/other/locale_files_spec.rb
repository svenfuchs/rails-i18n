# encoding: utf-8

require 'thor'
require 'spec_helper'
require_relative '../../rails/test/lib/check_locales.rb'

describe "Locale files" do
  # there should not be any orphan pluralization files
  it "pluralization files should have a corresponding locale.yml file" do
    expect(CheckLocales.orphan_pluralizations).to be_empty
  end  

  # all locales should have a pluralization file
  it "a locale file should have a corresponding pluralization file" do
    pending("Fix missing pluralizations")
    expect(CheckLocales.orphan_locales).to be_empty
  end

end 
