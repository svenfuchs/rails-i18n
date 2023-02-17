shared_examples 'Romanian language' do
  it 'has "one", "few", and "other" plural keys' do
    plural_keys.size.should == 3
    plural_keys.should include(:one, :few, :other)
  end

  it "detects that 1 in category 'one'" do
    rule.call(1).should == :one
  end

  [0, 2, 3, 5, 8, 9, 10, 11, 15, 19, 101, 106, 112, 117, 119,
   201].each do |count|
    it "detects that #{count.inspect} in category 'few'" do
      rule.call(count).should == :few
    end
  end

  [0.4, 1.7, 20, 21, 23, 34, 45, 66, 89, 100, 120, 138, nil,
   "abc"].each do |count|
    it "detects that #{count.inspect} in category 'other'" do
      rule.call(count).should == :other
    end
  end
end
