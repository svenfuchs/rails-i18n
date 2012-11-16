# Implementation of http://unicode.org/cldr/trac/browser/trunk/common/supplemental/plurals.xml
# with additional specs for I18n pluralization data format.
#
# Locales that behave like English are omitted, because I18n applies English plural rule
# to all locales without own plural rule.

require 'spec_helper'
require 'support/pluralization_file'

require 'unit/pluralization/ordinary'
require 'unit/pluralization/other'
require 'unit/pluralization/one_with_zero_other'
require 'unit/pluralization/one_upto_two_other'
require 'unit/pluralization/one_two_other'
require 'unit/pluralization/east_slavic'
require 'unit/pluralization/west_slavic'
require 'unit/pluralization/romanian'

describe 'Pluralization rule for' do

  pluralizations_dir = File.join('rails', 'pluralization')

  let(:file) do
    filename = File.join(pluralizations_dir, "#{example.metadata[:locale]}.rb")
    RailsI18n::Spec::PluralizationFile.new(filename)
  end

  let(:rule) do
    file.traverse_path(example.metadata[:locale], :i18n, :plural, :rule)
  end

  let(:plural_keys) do
    file.traverse_path(example.metadata[:locale], :i18n, :plural, :keys)
  end

  describe 'Akan', :locale => :ak do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one(with zero)-other forms language'
  end

  describe 'Amharic', :locale => :am do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one(with zero)-other forms language'
  end

  describe 'Arabic', :locale => :ar do
    it_behaves_like 'an ordinary pluralization rule'

    it 'has "zero", "one", "two", "few", "many" and "other" plural keys' do
      plural_keys.size.should == 6
      plural_keys.should include(:zero, :one, :two, :few, :many, :other)
    end

    it "detects that 0 in category 'zero'" do
      rule.call(0).should == :zero
    end

    it "detects that 1 in category 'one'" do
      rule.call(1).should == :one
    end

    it "detects that 2 in category 'two'" do
      rule.call(2).should == :two
    end

    [3, 4, 5, 6, 7, 8, 9, 10, 103, 105, 110].each do |count|
      it "detects that #{count} in category 'few'" do
        rule.call(count).should == :few
      end
    end

    [11, 12, 20, 51, 67, 89, 91, 99, 111, 158, 199].each do |count|
      it "detects that #{count} in category 'many'" do
        rule.call(count).should == :many
      end
    end

    [0.3, 1.2, 2.2, 8.5, 11.68, 100, 101, 102, 200, 201, 202].each do |count|
      it "detects that #{count} in category 'other'" do
        rule.call(count).should == :other
      end
    end
  end

  describe 'Azerbaijani', :locale => :az do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Bambara', :locale => :bm do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Belarusian', :locale => :be do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'East Slavic'
  end

  describe 'Bihari', :locale => :bh do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one(with zero)-other forms language'
  end

  describe 'Bosnian', :locale => :bs do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'East Slavic'
  end

  describe 'Breton', :locale => :br do
    it_behaves_like 'an ordinary pluralization rule'

    it 'has "one", "two", "few", "many" and "other" plural keys' do
      plural_keys.size.should == 5
      plural_keys.should include(:one, :two, :few, :many, :other)
    end

    [1, 21, 31, 41, 51, 61, 81, 101, 1031].each do |count|
      it "detects that #{count} in category 'one'" do
        rule.call(count).should == :one
      end
    end

    [2, 22, 32, 42, 52, 62, 82, 102, 1000002].each do |count|
      it "detects that #{count} in category 'two'" do
        rule.call(count).should == :two
      end
    end

    [3, 4, 9, 23, 24, 29].each do |count|
      it "detects that #{count} in category 'few'" do
        rule.call(count).should == :few
      end
    end

    [1000000, 3000000].each do |count|
      it "detects that #{count} in category 'many'" do
        rule.call(count).should == :many
      end
    end

    [0, 1.2, 3.94, 5, 6, 7, 8, 10, 11, 12, 15, 19, 20, 25, 26, 27, 28, 71, 72, 91, 92, 95, 99].each do |count|
      it "detects that #{count} in category 'other'" do
        rule.call(count).should == :other
      end
    end

  end

  describe 'Burmese', :locale => :my do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Central Morocco Tamazight', :locale => :tzm do
    it_behaves_like 'an ordinary pluralization rule'

    it 'has "one" and "other" plural keys' do
      plural_keys.size.should == 2
      plural_keys.should include(:one, :other)
    end

    [0, 1, 11, 12, 21, 22, 29, 37, 49, 87, 99].each do |count|
      it "detects that #{count} in category 'one'" do
        rule.call(count).should == :one
      end
    end

    [0.3, 1.7, 2, 3, 4, 5, 6, 7, 8, 9, 10, 100, 111, 121, 122, 137, 249].each do |count|
      it "detects that #{count} in category 'other'" do
        rule.call(count).should == :other
      end
    end
  end

  describe 'Chinese', :locale => :zh do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Colognian', :locale => :ksh do
    it_behaves_like 'an ordinary pluralization rule'

    it 'has "zero", "one" and "other" plural keys' do
      plural_keys.size.should == 3
      plural_keys.should include(:zero, :one, :other)
    end

    it "detects that 0 in category 'zero'" do
      rule.call(0).should == :zero
    end

    it "detects that 1 in category 'one'" do
      rule.call(1).should == :one
    end

    [0.3, 1.2, 2, 4, 5, 10, 11, 21, 23, 31, 50, 99, 100].each do |count|
      it "detects that #{count} in category 'other'" do
        rule.call(count).should == :other
      end
    end
  end

  describe 'Cornish', :locale => :kw do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one-two-other forms language'
  end

  describe 'Croatian', :locale => :hr do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'East Slavic'
  end

  describe 'Czech', :locale => :cs do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'West Slavic'
  end

  describe 'Dzongkha', :locale => :dz do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Filipino', :locale => :fil do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one(with zero)-other forms language'
  end

  describe 'French', :locale => :fr do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one(upto 2)-other forms language'
  end

  describe 'Fulah', :locale => :ff do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one(upto 2)-other forms language'
  end

  describe 'Georgian', :locale => :ka do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'guw', :locale => :guw do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one(with zero)-other forms language'
  end

  describe 'Hebrew', :locale => :he do
    it_behaves_like 'an ordinary pluralization rule'

    it 'has "one", "two", "many" and "other" plural keys' do
      plural_keys.size.should == 4
      plural_keys.should include(:one, :two, :many, :other)
    end

    it "detects that 1 in category 'one'" do
      rule.call(1).should == :one
    end

    it "detects that 2 in category 'two'" do
      rule.call(2).should == :other
    end

    [10, 30, 70, 100, 130].each do |count|
      it "detects that #{count} in category 'many'" do
        rule.call(count).should == :other
      end
    end

    [0, 1.2, 3.94, 8.2, 11, 12, 15, 19, 25, 27, 31, 52, 84, 99].each do |count|
      it "detects that #{count} in category 'other'" do
        rule.call(count).should == :other
      end
    end
  end

  describe 'Hindi', :locale => :hi do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one(with zero)-other forms language'
  end

  describe 'Hungarian', :locale => :hu do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Igbo', :locale => :ig do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Inari Sami', :locale => :smn do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one-two-other forms language'
  end

  describe 'Indonesian', :locale => :id do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Inuktitut', :locale => :iu do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one-two-other forms language'
  end

  describe 'Irish', :locale => :ga do
    it_behaves_like 'an ordinary pluralization rule'

    it 'has "one", "two", "few", "many" and "other" plural keys' do
      plural_keys.size.should == 5
      plural_keys.should include(:one, :two, :few, :many, :other)
    end

    it "detects that 1 in category 'one'" do
      rule.call(1).should == :one
    end

    it "detects that 2 in category 'two'" do
      rule.call(2).should == :two
    end

    [3, 4, 5, 6].each do |count|
      it "detects that #{count} in category 'few'" do
        rule.call(count).should == :few
      end
    end

    [7, 8, 9, 10].each do |count|
      it "detects that #{count} in category 'many'" do
        rule.call(count).should == :many
      end
    end

    [0, 1.2, 3.94, 8.2, 11, 12, 15, 19, 20, 25, 27, 31, 52, 84, 99, 100].each do |count|
      it "detects that #{count} in category 'other'" do
        rule.call(count).should == :other
      end
    end
  end

  describe 'Japanese', :locale => :ja do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Javanese', :locale => :jv do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Kabuverdianu', :locale => :kea do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Kabyle', :locale => :kab do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one(upto 2)-other forms language'
  end

  describe 'Kannada', :locale => :kn do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Khmer', :locale => :km do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Korean', :locale => :ko do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Koyraboro Senni', :locale => :ses do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Langi', :locale => :lag do
    it_behaves_like 'an ordinary pluralization rule'

    it 'has "zero", "one" and "other" plural keys' do
      plural_keys.size.should == 3
      plural_keys.should include(:zero, :one, :other)
    end

    it "detects that 0 in category 'zero'" do
      rule.call(0).should == :zero
    end

    [0.5, 1, 1.2, 1.8].each do |count|
      it "detects that #{count} in category 'one'" do
        rule.call(count).should == :one
      end
    end

    [2, 2.1, 5, 11, 21, 22, 37, 40, 900.5].each do |count|
      it "detects that #{count} in category 'other'" do
        rule.call(count).should == :other
      end
    end
  end

  describe 'Lao', :locale => :lo do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Latvian', :locale => :lv do
    it_behaves_like 'an ordinary pluralization rule'

    it 'has "one" and "other" plural keys' do
      plural_keys.size.should == 2
      plural_keys.should include(:one, :other)
    end

    [1, 21, 31, 41, 51, 61, 101].each do |count|
      it "detects that #{count} in category 'one'" do
        rule.call(count).should == :one
      end
    end

    [0, 0.4, 1.7, 2, 5, 10, 11, 20, 22, 37, 40, 111, 123].each do |count|
      it "detects that #{count} in category 'other'" do
        rule.call(count).should == :other
      end
    end
  end

  describe 'Lingala', :locale => :ln do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one(with zero)-other forms language'
  end

  describe 'Lithuanian', :locale => :lt do
    it_behaves_like 'an ordinary pluralization rule'

    it 'has "one", "few" and "other" plural keys' do
      plural_keys.size.should == 3
      plural_keys.should include(:one, :few, :other)
    end

    [1, 21, 31, 41, 51, 61, 101].each do |count|
      it "detects that #{count} in category 'one'" do
        rule.call(count).should == :one
      end
    end

    [2, 3, 5, 8, 9, 22, 26, 29, 32, 34, 39, 109].each do |count|
      it "detects that #{count} in category 'few'" do
        rule.call(count).should == :few
      end
    end

    [0, 0.4, 1.7, 10, 11, 15, 20, 30, 40, 70, 111, 122.7].each do |count|
      it "detects that #{count} in category 'other'" do
        rule.call(count).should == :other
      end
    end
  end

  describe 'Lule Sami', :locale => :smj do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one-two-other forms language'
  end

  # TODO http://unicode.org/cldr/trac/ticket/3426
  describe 'Macedonian', :locale => :mk do
    it_behaves_like 'an ordinary pluralization rule'

    it 'has "one" and "other" plural keys' do
      plural_keys.size.should == 2
      plural_keys.should include(:one, :other)
    end

    [1, 21, 31, 41, 51, 61, 101, 111, 131].each do |count|
      it "detects that #{count} in category 'one'" do
        rule.call(count).should == :one
      end
    end

    [0, 0.4, 1.7, 2, 7, 10, 11, 15, 20, 27, 33, 46, 70, 122.7].each do |count|
      it "detects that #{count} in category 'other'" do
        rule.call(count).should == :other
      end
    end
  end

  describe 'Makonde', :locale => :kde do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Malagasy', :locale => :mg do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one(with zero)-other forms language'
  end

  describe 'Malay', :locale => :ms do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  # TODO http://unicode.org/cldr/trac/ticket/3426
  describe 'Maltese', :locale => :mt do
    it_behaves_like 'an ordinary pluralization rule'

    it 'has "one", "few", "many" and "other" plural keys' do
      plural_keys.size.should == 4
      plural_keys.should include(:one, :few, :many, :other)
    end

    it "detects that 1 in category 'one'" do
      rule.call(1).should == :one
    end

    [0, 2, 3, 5, 8, 9, 10, 102, 104, 106, 107, 110].each do |count|
      it "detects that #{count} in category 'few'" do
        rule.call(count).should == :few
      end
    end

    [11, 13, 16, 18, 19, 111, 112, 115, 117, 119].each do |count|
      it "detects that #{count} in category 'many'" do
        rule.call(count).should == :many
      end
    end

    [0.4, 1.7, 20, 21, 23, 34, 45, 66, 89, 100, 101].each do |count|
      it "detects that #{count} in category 'other'" do
        rule.call(count).should == :other
      end
    end
  end

  describe 'Manx', :locale => :gv do
    it_behaves_like 'an ordinary pluralization rule'

    it 'has "one", and "other" plural keys' do
      plural_keys.size.should == 2
      plural_keys.should include(:one, :other)
    end

    [0, 1, 2, 11, 12, 20, 21, 22, 51, 60].each do |count|
      it "detects that #{count} in category 'one'" do
        rule.call(count).should == :one
      end
    end

    [0.4, 1.7, 3, 4, 6, 9, 10, 13, 15, 17, 19, 23, 28, 30].each do |count|
      it "detects that #{count} in category 'other'" do
        rule.call(count).should == :other
      end
    end
  end

  describe 'Moldavian', :locale => :mo do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'Romanian language'
  end

  describe 'Nama', :locale => :naq do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one-two-other forms language'
  end

  describe 'Northern Sami', :locale => :se do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one-two-other forms language'
  end

  describe 'Northen Sotho', :locale => :nso do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one(with zero)-other forms language'
  end

  # http://unicode.org/cldr/trac/ticket/4187
  describe 'Persian', :locale => :fa do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Polish', :locale => :pl do
    it_behaves_like 'an ordinary pluralization rule'

    it 'has "one", "few", "many" and "other" plural keys' do
      plural_keys.size.should == 4
      plural_keys.should include(:one, :few, :many, :other)
    end

    it "detects that 1 in category 'one'" do
      rule.call(1).should == :one
    end

    [2, 3, 4, 22, 23, 24, 92, 93, 94].each do |count|
      it "detects that #{count} in category 'few'" do
        rule.call(count).should == :few
      end
    end

    [0, 5, 8, 10, 11, 18, 20, 21, 25, 27, 30, 31, 35, 38, 40, 41, 114].each do |count|
      it "detects that #{count} in category 'many'" do
        rule.call(count).should == :many
      end
    end

    [1.2, 3.7, 11.5, 20.8, 1004.3].each do |count|
      it "detects that #{count} in category 'other'" do
        rule.call(count).should == :other
      end
    end
  end

  describe 'Romanian', :locale => :ro do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'Romanian language'
  end

  describe 'Root', :locale => :root do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Russian', :locale => :ru do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'East Slavic'
  end

  describe 'Sakha', :locale => :sah do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Sami Language', :locale => :smi do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one-two-other forms language'
  end

  describe 'Sango', :locale => :sg do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Scottish Gaelic', :locale => :gd do
    it_behaves_like 'an ordinary pluralization rule'

    it 'has "one", "two", "few", and "other" plural keys' do
      plural_keys.size.should == 4
      plural_keys.should include(:one, :few, :two, :other)
    end

    [1, 11].each do |count|
      it "detects that #{count} in category 'one'" do
        rule.call(count).should == :one
      end
    end

    [2, 12].each do |count|
      it "detects that #{count} in category 'two'" do
        rule.call(count).should == :two
      end
    end

    [3, 5, 7, 9, 10, 13, 14, 16, 18, 19].each do |count|
      it "detects that #{count} in category 'few'" do
        rule.call(count).should == :few
      end
    end

    [0, 1.2, 3.7, 20, 21, 23, 25, 31, 44, 58, 71, 84, 99, 100].each do |count|
      it "detects that #{count} in category 'other'" do
        rule.call(count).should == :other
      end
    end
  end

  describe 'Serbian', :locale => :sr do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'East Slavic'
  end

  describe 'Serbo-Croatian', :locale => :sh do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'East Slavic'
  end

  describe 'Sichuan Yi', :locale => :ii do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Skolt Sami', :locale => :sms do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one-two-other forms language'
  end

  describe 'Slovak', :locale => :sk do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'West Slavic'
  end

  describe 'Slovenian', :locale => :sl do
    it_behaves_like 'an ordinary pluralization rule'

    it 'has "one", "two", "few", and "other" plural keys' do
      plural_keys.size.should == 4
      plural_keys.should include(:one, :few, :two, :other)
    end

    [1, 101, 201, 301, 601].each do |count|
      it "detects that #{count} in category 'one'" do
        rule.call(count).should == :one
      end
    end

    [2, 102, 302, 502].each do |count|
      it "detects that #{count} in category 'two'" do
        rule.call(count).should == :two
      end
    end

    [3, 4, 103, 104, 203, 204, 403, 404].each do |count|
      it "detects that #{count} in category 'few'" do
        rule.call(count).should == :few
      end
    end

    [0, 1.2, 3.7, 5, 10, 11, 12, 13, 17, 20, 21, 23, 71, 84, 99, 100].each do |count|
      it "detects that #{count} in category 'other'" do
        rule.call(count).should == :other
      end
    end
  end

  describe 'Southern Sami', :locale => :sma do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one-two-other forms language'
  end

  describe 'Tachelhit', :locale => :shi do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one(with zero)-other forms language'
  end

  describe 'Tagalog', :locale => :tl do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one(with zero)-other forms language'
  end

  describe 'Thai', :locale => :th do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Tibetan', :locale => :bo do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Tigrinya', :locale => :ti do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one(with zero)-other forms language'
  end

  describe 'Tongan', :locale => :to do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Turkish', :locale => :tr do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Ukrainian', :locale => :uk do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'East Slavic'
  end

  describe 'Vietnamese', :locale => :vi do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Walloon', :locale => :wa do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'one(with zero)-other forms language'
  end

  describe 'Welsh', :locale => :cy do
    it_behaves_like 'an ordinary pluralization rule'

    it 'has "zero", "one", "two", "few", "many" and "other" plural keys' do
      plural_keys.size.should == 6
      plural_keys.should include(:zero, :one, :two, :few, :many, :other)
    end

    it "detects that 0 in category 'zero'" do
      rule.call(0).should == :zero
    end

    it "detects that 1 in category 'one'" do
      rule.call(1).should == :one
    end

    it "detects that 2 in category 'two'" do
      rule.call(2).should == :two
    end

    it "detects that 3 in category 'few'" do
      rule.call(3).should == :few
    end

    it "detects that 6 in category 'many'" do
      rule.call(6).should == :many
    end

    [0.3, 1.2, 4, 5, 7, 10, 11, 12, 13, 17, 20, 21, 23, 71, 84, 99, 100].each do |count|
      it "detects that #{count} in category 'other'" do
        rule.call(count).should == :other
      end
    end
  end

  describe 'Wolof', :locale => :wo do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end

  describe 'Yoruba', :locale => :yo do
    it_behaves_like 'an ordinary pluralization rule'
    it_behaves_like 'other form language'
  end
end
