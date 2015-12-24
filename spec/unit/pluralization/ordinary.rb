shared_examples 'an ordinary pluralization rule' do
  it 'returns a hash' do |example|
    file.content.should be_a Hash
  end

  it 'has one top level namespace' do |example|
    file.content.keys.size.should == 1
  end

  it 'has its locale tag as a top level namespace' do |example|
    file.content.keys.first.should == example.metadata[:locale]
  end

  it 'has lambda or Proc under the "i18n.plural.rule" namespace' do
    rule.should respond_to :call
  end
end
