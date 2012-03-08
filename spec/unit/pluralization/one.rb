shared_examples 'one form language' do
  it 'has "other" plural keys' do
    plural_keys.should == [:one]
  end

  [0, 1, 1.2, 2, 5, 11, 21, 22, 27, 99, 1000].each do |count|
    it "detects that #{count} in category 'one'" do
      rule.call(count).should == :one
    end
  end
end
