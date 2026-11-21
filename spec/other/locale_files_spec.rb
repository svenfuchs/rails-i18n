# encoding: utf-8

require 'thor'
require 'yaml'
require 'spec_helper'
require_relative '../../rails/test/lib/check_locales.rb'

describe "Locale files" do
  # there should not be any orphan pluralization files
  it "a pluralization file should have a corresponding locale.yml file" do
    expect(CheckLocales.orphan_pluralizations).to be_empty
  end  

  # all locales should have a pluralization file
  it "a locale file should have a corresponding pluralization file" do
    pending("Fix missing pluralizations")
    expect(CheckLocales.orphan_locales).to be_empty
  end

  # Rails raises in date_select/datetime_select when date.order has anything
  # other than :year, :month and :day
  it "date.order should only contain year, month and day" do
    invalid = Dir[File.expand_path('../../../rails/locale/*.yml', __FILE__)].select do |file|
      order = YAML.unsafe_load_file(file).values.first.dig('date', 'order')
      order && order.map(&:to_sym).sort != [:day, :month, :year]
    end
    expect(invalid.map { |file| File.basename(file) }).to be_empty
  end

end
