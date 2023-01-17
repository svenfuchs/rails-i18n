shared_examples 'one-two-other forms language' do
  it 'has "one", "two" and "other" plural keys' do
    plural_keys.size.should == 3
    plural_keys.should include(:one, :two, :other)
  end

  [1, "1"].each do |count|
    it "detects that #{count.inspect} in category 'one'" do
      rule.call(count).should == :one
    end
  end

  [2, "2"].each do |count|
    it "detects that #{count.inspect} in category 'two'" do
      rule.call(count).should == :two
    end
  end

  [0, 0.3, 1.2, 3, "3", 5, 10, 11, 21, 23, 31, 50, 81, 99, 100].each do |count|
    it "detects that #{count.inspect} in category 'other'" do
      rule.call(count).should == :other
    end
  end
end
