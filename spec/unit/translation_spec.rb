# coding: utf-8

require 'spec_helper'

Dir.glob('rails/locale/*.yml') do |locale_file|
  next if locale_file == 'rails/locale/es-419.yml'
  describe "a rails-i18n #{locale_file} locale file" do
    it_behaves_like 'a valid locale file', locale_file
    it { locale_file.should be_a_subset_of('rails/locale/en.yml') }
  end
end

describe "a rails-i18n rails/locale/es-419.yml locale file" do
  subject { 'rails/locale/es-419.yml' }
  it { should be_parseable }
  it { should have_valid_pluralization_keys }
  it { should_not have_missing_pluralization_keys }
  it { should have_one_top_level_namespace }
  it { should be_named_like_top_level_namespace }
  it { should_not have_legacy_interpolations }
  it { pending('es-419 is not included in iso gem as a valid locale'); should have_a_valid_locale }
end
