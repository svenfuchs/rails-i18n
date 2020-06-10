RSpec::Matchers.define :have_missing_particular_pluralization_keys do
  match do |actual|
    @locale_file = I18nSpec::LocaleFile.new(actual)

    keys =
      if @locale_file.locale.language
        @locale_file.missing_pluralization_keys.reject do |key, value|
          key.match(/\.errors\.messages\.restrict_dependent_destroy$/)
        end
      else
        []
      end

    keys.any?
  end

  failure_message_when_negated do |filepath|
    flattened_keys = []

    @locale_file.errors[:missing_pluralization_keys].each do |parent, subkeys|
      next if subkeys[-2] == 'restrict_dependent_destroy'
      subkeys.each do |subkey|
        flattened_keys << [parent, subkey].join('.')
      end
    end

    "expected #{filepath} to contain the following pluralization keys :\n- " << flattened_keys.join("\n- ")
  end
end
