# coding: utf-8

require 'spec_helper'

describe "will_paginate" do
  it "should give translations for will_paginate" do
    I18n.t("will_paginate.next_label").should == "next →"
  end
end
