shared_examples 'West Slavic' do
  it 'has "one", "few" and "other" plural keys' do
    plural_keys.size.should == 3
    plural_keys.should include(:one, :few, :other)
  end

  it "detects that 1 in category 'one'" do
    rule.call(1).should == :one
  end

  [2, 3, 4].each do |count|
    it "detects that #{count.inspect} in category 'few'" do
      rule.call(count).should == :few
    end
  end

  [0, 0.5, 1.7, 2.1, 5, 7.8, 10, 875, nil, "abc"].each do |count|
    it "detects that #{count.inspect} in category 'other'" do
      rule.call(count).should == :other
    end
  end
end
