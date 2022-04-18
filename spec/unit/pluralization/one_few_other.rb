shared_examples 'one-few-other forms language' do
  [1, 21, 31, 41, 51, 61, 71, 81, 101, 1001,
   0.1, 1.1, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1, 10.1, 100.1, 1000.1].each do |count|
    it "detects that #{count} in category 'one'" do
      rule.call(count).should == :one
    end
  end
  
  [2, 3, 4, 22, 23, 24, 32, 33, 34, 42, 43, 44, 52, 53, 54, 62, 102, 1002,
   0.2, 0.3, 0.4, 1.2, 1.3, 1.4, 2.2, 2.3, 2.4, 3.2, 3.3, 3.4, 4.2, 4.3, 4.4, 5.2, 10.2, 100.2, 1000.2].each do |count|
    it "detects that #{count} in category 'few'" do
      rule.call(count).should == :few
    end
  end

  [0, 5, 6, 7, 17, 18, 19, 100, 1000, 10000, 100000, 1000000,
   0.0, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.5, 1.7, 2.0, 2.5, 2.6, 2.7, 10.0, 100.0, 1000.0, 10000.0, 100000.0, 1000000.0].each do |count|
    it "detects that #{count} in category 'other'" do
      rule.call(count).should == :other
    end
  end
end
