# coding: utf-8

require 'spec_helper'

Dir.glob('rails/locale/*.yml') do |locale_file|
  describe "a rails-i18n #{locale_file} locale file" do
    it_behaves_like 'a valid locale file', locale_file
    it { locale_file.should be_a_subset_of('rails/locale/en.yml') }
  end
end
