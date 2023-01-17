shared_examples 'other form language' do
  it 'has "other" plural keys' do
    plural_keys.should == [:other]
  end

  [0, 1, "1", 1.2, "1.2", 2, 5, 11, 21, 22, 27, 99, 1_000].each do |count|
    it "detects that #{count.inspect} in category 'other'" do
      rule.call(count).should == :other
    end
  end
end
