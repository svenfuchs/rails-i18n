shared_examples 'one-few-other forms language' do
  [1, "1", 21, 31, 41, 51, 61, 71, 81, 101, 1001,
   0.1, "0.1", 1.1, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1, 10.1, 100.1,
   1_000.1].each do |count|
    it "detects that #{count.inspect} in category 'one'" do
      rule.call(count).should == :one
    end
  end

  [2, "2", 3, 4, 22, 23, 24, 32, 33, 34, 42, 43, 44, 52, 53, 54, 62, 102, 1_002,
   0.2, "0.2", 0.3, 0.4, 1.2, 1.3, 1.4, 2.2, 2.3, 2.4, 3.2, 3.3, 3.4, 4.2, 4.3,
   4.4, 5.2, 10.2, 100.2, 1_000.2].each do |count|
    it "detects that #{count.inspect} in category 'few'" do
      rule.call(count).should == :few
    end
  end

  [0, "0", 5, "5", 6, 7, 17, 18, 19, 100, 1_000, 10_000, 100_000, 1_000_000,
   0.0, 0.5, "0.5", 0.6, 0.7, 0.8, 0.9, 1.5, 1.6, 1.7, 2.5, 2.6, 2.7, 10.0,
   100.0, 1_000.0, 10_000.0, 100_000.0, 1_000_000.0, nil].each do |count|
    it "detects that #{count.inspect} in category 'other'" do
      rule.call(count).should == :other
    end
  end
end
