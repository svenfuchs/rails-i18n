# encoding: utf-8

require 'thor'
require 'spec_helper'
require_relative '../../rails/test/lib/check_locales.rb'

describe "Locale files" do
  # there should not be any orphan pluralization files
  it "pluralization files should have a corresponding locale.yml file" do
    expect(CheckLocales.orphaned_pluralizations).to be_empty
  end  


end 
