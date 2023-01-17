shared_examples 'one-other forms language' do
  it 'has "one" and "other" plural keys' do
    plural_keys.size.should == 2
    plural_keys.should include(:one, :other)
  end

  [1, "1"].each do |count|
    it "detects that #{count.inspect} in category 'one'" do
      rule.call(count).should == :one
    end
  end

  [0, "0", 0.3, 1.2, 2, "2", 3, 5, 10, 11, 21, 23, 31, 50, 81,
   99, 100].each do |count|
    it "detects that #{count.inspect.inspect} in category 'other'" do
      rule.call(count).should == :other
    end
  end
end
