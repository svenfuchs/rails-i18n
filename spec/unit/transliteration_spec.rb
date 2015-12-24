# encoding: utf-8

require 'spec_helper'
require 'support/transliteration_file'

require 'unit/transliteration/ordinary'
require 'unit/transliteration/ukrainian'

describe "Transliteration rule for" do
  transliterations_dir = File.join('rails', 'transliteration')

  let(:file) do |example|
    filename = Dir[File.join(transliterations_dir, "#{example.metadata[:locale]}*")].first
    RailsI18n::Spec::TransliterationFile.make(filename)
  end

  let(:rule) do |example|
    file.traverse_path(example.metadata[:locale], :i18n, :transliterate, :rule)
  end

  def t(string)
    file.transliterate(string)
  end

  describe "Bulgarian", :locale => :bg do
    it_behaves_like "an ordinary transliteration rule"

    it "works" do
      t('съществуват').should == 'sashtestvuvat'
    end
  end

  describe "Russian", :locale => :ru do
    it_behaves_like "an ordinary transliteration rule"

    # https://github.com/yaroslav/russian/blob/master/spec/transliteration_spec.rb
    it "should transliterate properly" do
      t("Это просто некий текст").should == "Eto prosto nekiy tekst"
      t("щ").should == "sch"
      t("стансы").should == "stansy"
      t("упущение").should == "upuschenie"
      t("ш").should == "sh"
      t("Ш").should == "SH"
      t("ц").should == "ts"
    end

    it "should properly transliterate mixed russian-english strings" do
      t("Это кусок строки русских букв v peremeshku s latinizey i амперсандом (pozor!) & something").should ==
        "Eto kusok stroki russkih bukv v peremeshku s latinizey i ampersandom (pozor!) & something"
    end

    it "should properly transliterate mixed case chars in a string" do
      t("НЕВЕРОЯТНОЕ УПУЩЕНИЕ").should == "NEVEROYATNOE UPUSCHENIE"
      t("Невероятное Упущение").should == "Neveroyatnoe Upuschenie"
      t("Шерстяной Заяц").should == "Sherstyanoy Zayats"
      t("Н.П. Шерстяков").should == "N.P. Sherstyakov"
      t("ШАРОВАРЫ").should == "SHAROVARY"
    end

    it "should work for multi-char substrings" do
      t("38 воробьёв").should == "38 vorobiev"
      t("Вася Воробьёв").should == "Vasya Vorobiev"
      t("Алябьев").should == "Alyabiev"
      t("АЛЯБЬЕВ").should == "ALYABIEV"
    end
  end

  describe "Ukrainian", :locale => :uk do
    it_behaves_like "an ordinary transliteration rule"

    include_examples "Ukrainian transliteration"
  end
end
