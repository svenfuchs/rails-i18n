shared_examples 'one(with zero)-other forms language' do
  it 'has "one" and "other" plural keys' do
    plural_keys.size.should == 2
    plural_keys.should include(:one, :other)
  end

  it "detects that 0 in category 'one'" do
    rule.call(0).should == :one
  end

  it "detects that 1 in category 'one'" do
    rule.call(1).should == :one
  end

  [0.4, 1.2, 2, 5, 11, 21, 22, 27, 99, 1000].each do |count|
    it "detects that #{count} in category 'other'" do
      rule.call(count).should == :other
    end
  end
end