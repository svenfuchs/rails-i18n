shared_examples 'one(with zero)-other forms language' do
  it 'has "one" and "other" plural keys' do
    plural_keys.size.should == 2
    plural_keys.should include(:one, :other)
  end

  [0, "0", 1, "1", nil].each do |count|
    it "detects that #{count.inspect} in category 'one'" do
      rule.call(count).should == :one
    end
  end

  [0.4, 1.2, 2, "2", 5, 11, 21, 22, 27, 99, 1_000].each do |count|
    it "detects that #{count.inspect} in category 'other'" do
      rule.call(count).should == :other
    end
  end
end
