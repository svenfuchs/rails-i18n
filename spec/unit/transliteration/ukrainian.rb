# encoding: utf-8

# Below is an implementation of the official transliteration rules
# http://zakon2.rada.gov.ua/laws/show/55-2010-%D0%BF

shared_examples "Ukrainian transliteration" do

  it "properly transliterates 'ь'" do
    t("Ь").should == ''
    t("ь").should == ''
  end

  it "properly transliterates 'Аa'" do
    t('А').should == 'A'
    t('а').should == 'a'
  end

  it "properly transliterates 'Бб'" do
    t('Б').should == 'B'
    t('б').should == 'b'
  end

  it "properly transliterates 'Вв'" do
    t('В').should == 'V'
    t('в').should == 'v'
  end

  it "properly transliterates 'Гг'" do
    t('Г').should == 'H'
    t('г').should == 'h'
  end

  it "properly transliterates 'Ґґ'" do
    t('Ґ').should == 'G'
    t('ґ').should == 'g'
  end

  it "properly transliterates 'Дд'" do
    t('Д').should == 'D'
    t('д').should == 'd'
  end

  it "properly transliterates 'Ее'" do
    t('Е').should == 'E'
    t('е').should == 'e'
  end

  it "properly transliterates 'Жж'" do
    t('Ж').should == 'ZH'
    t('ж').should == 'zh'
  end

  it "properly transliterates 'Зз'" do
    t('З').should == 'Z'
    t('з').should == 'z'
  end

  it "properly transliterates 'Ии'" do
    t('И').should == 'Y'
    t('и').should == 'y'
  end

  it "properly transliterates 'Іі'" do
    t('І').should == 'I'
    t('і').should == 'i'
  end

  it "properly transliterates 'Кк'" do
    t('К').should == 'K'
    t('к').should == 'k'
  end

  it "properly transliterates 'Лл'" do
    t('Л').should == 'L'
    t('л').should == 'l'
  end

  it "properly transliterates 'Мм'" do
    t('М').should == 'M'
    t('м').should == 'm'
  end

  it "properly transliterates 'Нн'" do
    t('Н').should == 'N'
    t('н').should == 'n'
  end

  it "properly transliterates 'Оо'" do
    t('О').should == 'O'
    t('о').should == 'o'
  end

  it "properly transliterates 'Пп'" do
    t('П').should == 'P'
    t('п').should == 'p'
  end

  it "properly transliterates 'Рр'" do
    t('Р').should == 'R'
    t('р').should == 'r'
  end

  it "properly transliterates 'Сс'" do
    t('С').should == 'S'
    t('с').should == 's'
  end

  it "properly transliterates 'Тт'" do
    t('Т').should == 'T'
    t('т').should == 't'
  end

  it "properly transliterates 'Уу'" do
    t('У').should == 'U'
    t('у').should == 'u'
  end

  it "properly transliterates 'Фф'" do
    t('Ф').should == 'F'
    t('ф').should == 'f'
  end

  it "properly transliterates 'Хх'" do
    t('Х').should == 'KH'
    t('х').should == 'kh'
  end

  it "properly transliterates 'Цц'" do
    t('Ц').should == 'TS'
    t('ц').should == 'ts'
  end

  it "properly transliterates 'Чч'" do
    t('Ч').should == 'CH'
    t('ч').should == 'ch'
  end

  it "properly transliterates 'Шш'" do
    t('Ш').should == 'SH'
    t('ш').should == 'sh'
  end

  it "properly transliterates 'Щщ'" do
    t('Щ').should == 'SHCH'
    t('щ').should == 'shch'
  end

  it "properly transliterates 'зг'" do
    t('зг').should == 'zgh'
    t('Згори').should == 'Zghory'
    t('РОЗГОН').should == 'ROZGHON'
  end

  it "properly transliterates apostrophe" do
    t("д'Арк").should == 'dArk'
    t('д’Арк').should == 'dArk'
    t("ці 'треба' залишити").should == "tsi 'treba' zalyshyty"
  end

  it "properly transliterates 'Єє'" do
    t('Єнакієве').should == 'Yenakiieve'
    t('євродолар').should == 'yevrodolar'
    t('Гаєвич').should == 'Haievych'
    t("Короп'є").should == 'Koropie'
  end

  it "properly transliterates 'Її'" do
    t('Їжакевич').should == 'Yizhakevych'
    t('їсти').should == 'yisty'
    t('Кадиївка').should == 'Kadyivka'
    t("Мар'їне").should == 'Marine'
  end

  it "properly transliterates 'Йй'" do
    t('Йосипівка').should == 'Yosypivka'
    t('йоржик').should == 'yorzhyk'
    t('Стрий').should == 'Stryi'
    t('Андрій').should == 'Andrii'
  end

  it "properly transliterates 'Юю'" do
    t('Юрій').should == 'Yurii'
    t('юрба').should == 'yurba'
    t('Корюківка').should == 'Koriukivka'
  end

  it "properly transliterates 'Яя'" do
    t('Яготин').should == 'Yahotyn'
    t('ялина').should == 'yalyna'
    t('Костянтин').should == 'Kostiantyn'
    t("Знам'янка").should == 'Znamianka'
    t('Феодосія').should == 'Feodosiia'
  end

  it "properly transliterates mixed case chars in a string" do
    t("ЖОЗЕФ МОНЬЄ").should == "ZHOZEF MONIE"
    t("СПАЛАХ, поЇхали, МаріЯ").should == "SPALAKH, poIkhaly, MariIA"
    t("ЖаН жеНе").should == "ZhaN zheNe"
  end

  it "properly transliterates strings with punctuation, digits and symbols" do
    t("© Іван Кошелівець. Жанна д'Арк. Київ 1997, ISBN 5-7372-0031-0").should ==
        "© Ivan Koshelivets. Zhanna dArk. Kyiv 1997, ISBN 5-7372-0031-0"
  end
end