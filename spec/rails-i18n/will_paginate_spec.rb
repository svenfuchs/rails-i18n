require 'spec_helper'

describe "will_paginate" do
  it "should give translations for will_paginate" do
    I18n.t("will_paginate.next_label").should == "Next &#8594;"
  end
end

Dir.glob('will_paginate/*.yml') do |locale_file|
  describe "a will_paginate locale file" do
    it_behaves_like 'a valid locale file', locale_file
    it { locale_file.should be_a_subset_of('will_paginate/en-US.yml') }
  end
end