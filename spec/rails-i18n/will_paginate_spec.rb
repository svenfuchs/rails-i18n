require 'spec_helper'

describe "will_paginate" do
  it "should give translations for will_paginate" do
    I18n.t("will_paginate.next_label").should == "Next &#8594;"
  end
end
