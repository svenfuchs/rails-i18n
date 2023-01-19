shared_examples 'one(upto 2)-other forms language' do
  it 'has "one" and "other" plural keys' do
    plural_keys.size.should == 2
    plural_keys.should include(:one, :other)
  end

  [0, 0.5, 1, 1.2, 1.8].each do |count|
    it "detects that #{count.inspect} in category 'one'" do
      rule.call(count).should == :one
    end
  end

  [2, 2.1, 5, 11, 21, 22, 37, 40, 900.5, nil, "abc"].each do |count|
    it "detects that #{count.inspect} in category 'other'" do
      rule.call(count).should == :other
    end
  end
end
