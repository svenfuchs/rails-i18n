shared_examples 'an ordinary transliteration rule' do
  it 'returns a hash' do
    file.content.should be_a Hash
  end

  it 'has one top level namespace' do
    file.content.keys.size.should == 1
  end

  it 'has its locale tag as a top level namespace' do |example|
    file.content.keys.first.should == example.metadata[:locale]
  end

  it 'has lambda or Proc, or Hash under the "i18n.transliterate.rule" namespace' do
    rule.should satisfy { |rule| rule.is_a?(Proc) || rule.is_a?(Hash) }
  end
end
