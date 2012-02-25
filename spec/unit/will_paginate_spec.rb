require 'spec_helper'

Dir.glob('will_paginate/*.yml') do |locale_file|
  describe "a will_paginate locale file" do
    it_behaves_like 'a valid locale file', locale_file
    it { locale_file.should be_a_subset_of('will_paginate/en-US.yml') }
  end
end