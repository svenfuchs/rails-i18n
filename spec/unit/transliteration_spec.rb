# encoding: utf-8

require 'spec_helper'
require 'support/transliteration_file'

require 'unit/transliteration/ordinary'

describe "Transliteration rule for" do
  transliterations_dir = File.join('rails', 'transliteration')

  let(:file) do
    filename = Dir[File.join(transliterations_dir, "#{example.metadata[:locale]}*")].first
    RailsI18n::Spec::TransliterationFile.make(filename)
  end

  let(:rule) do
    file.traverse_path(example.metadata[:locale], :i18n, :transliterate, :rule)
  end

  describe "Bulgarian", :locale => :bg do
    it_behaves_like "an ordinary transliteration rule"

    it "works" do
      file.transliterate('съществуват').should == 'sashtestvuvat'
    end
  end

  describe "Russian", :locale => :ru do
    it_behaves_like "an ordinary transliteration rule"

    it "works" do
      file.transliterate('кошелёк утерян').should == 'koshelyok uteryan'
      file.transliterate('честность').should == 'chestnost'
      file.transliterate('Пьеро').should == 'Piero'
    end
  end
end