shared_examples 'East Slavic' do
  it 'has "one", "few", "many" and "other" plural keys' do
    plural_keys.size.should == 4
    plural_keys.should include(:one, :few, :many, :other)
  end

  [1, "1", 21, 51, 71, 101, 1031].each do |count|
    it "detects that #{count.inspect} in category 'one'" do
      rule.call(count).should == :one
    end
  end

  [2, "2", 3, 4, 22, 23, 24, 92, 93, 94].each do |count|
    it "detects that #{count.inspect} in category 'few'" do
      rule.call(count).should == :few
    end
  end

  [0, "0", 5, "5", 8, 10, 11, 18, 20, 25, 27, 30, 35, 38, 40].each do |count|
    it "detects that #{count.inspect} in category 'many'" do
      rule.call(count).should == :many
    end
  end

  [1.2, "1.2", 3.7, 11.5, 20.8, 1004.3].each do |count|
    it "detects that #{count.inspect} in category 'other'" do
      rule.call(count).should == :other
    end
  end
end
