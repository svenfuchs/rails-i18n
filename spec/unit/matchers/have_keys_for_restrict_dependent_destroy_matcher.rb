RSpec::Matchers.define :have_keys_for_restrict_dependent_destroy do
  def check_keys(scope, hash)
    return unless hash['errors']
    return unless hash['errors']['messages']
    return unless hash['errors']['messages']['restrict_dependent_destroy']
    return if hash['errors']['messages']['restrict_dependent_destroy'].kind_of?(String)
    h = hash['errors']['messages']['restrict_dependent_destroy'].clone
    %w(one many).each do |key|
      unless h.delete(key)
        @missing_keys << @locale_file.locale_code + scope + '.errors.messages.restrict_dependent_destroy.' + key
      end
    end
    h.keys.each do |key|
      @redundant_keys << @locale_file.locale_code + scope + '.errors.messages.restrict_dependent_destroy.' + key
    end
  end

  match do |actual|
    @locale_file = I18nSpec::LocaleFile.new(actual)
    @missing_keys = []
    @redundant_keys = []
    root = @locale_file.translations[@locale_file.locale_code]
    check_keys('', root)
    check_keys('.activemodel', root['activemodel']) if root['activemodel']
    check_keys('.activerecord', root['activerecord']) if root['activerecord']
    @missing_keys.empty? && @redundant_keys.empty?
  end

  failure_message_for_should do |filepath|
    message = ''
    if @missing_keys.any?
      message << "expected #{filepath} to contain the following keys :\n- "
      message << @missing_keys.join("\n- ")
    end
    if @redundant_keys.any?
      message << "\n" unless message.empty?
      message << "expected #{filepath} not to contain the following keys :\n- "
      message << @redundant_keys.join("\n- ")
    end
    message
  end
end
