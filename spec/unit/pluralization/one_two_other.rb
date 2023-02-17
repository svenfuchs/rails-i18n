shared_examples 'one-two-other forms language' do
  it 'has "one", "two" and "other" plural keys' do
    plural_keys.size.should == 3
    plural_keys.should include(:one, :two, :other)
  end

  it "detects that 1 in category 'one'" do
    rule.call(1).should == :one
  end

  it "detects that 2 in category 'two'" do
    rule.call(2).should == :two
  end

  [0, 0.3, 1.2, 3, 5, 10, 11, 21, 23, 31, 50, 81, 99, 100, nil,
   "abc"].each do |count|
    it "detects that #{count.inspect} in category 'other'" do
      rule.call(count).should == :other
    end
  end
end
