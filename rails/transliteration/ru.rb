# (c) Yaroslav Markin, Julian "julik" Tarkhanov and Co
# (http://github.com/yaroslav/russian)

module RailsI18n
  module Transliteration
    module Russian
      LOWER_SINGLE = {
        "і"=>"i","ґ"=>"g","ё"=>"yo","№"=>"#","є"=>"e",
        "ї"=>"yi","а"=>"a","б"=>"b",
        "в"=>"v","г"=>"g","д"=>"d","е"=>"e","ж"=>"zh",
        "з"=>"z","и"=>"i","й"=>"y","к"=>"k","л"=>"l",
        "м"=>"m","н"=>"n","о"=>"o","п"=>"p","р"=>"r",
        "с"=>"s","т"=>"t","у"=>"u","ф"=>"f","х"=>"h",
        "ц"=>"ts","ч"=>"ch","ш"=>"sh","щ"=>"sch","ъ"=>"'",
        "ы"=>"y","ь"=>"","э"=>"e","ю"=>"yu","я"=>"ya",
      }

      LOWER_MULTI = {
        "ье"=>"ie",
        "ьё"=>"ie",
      }

      UPPER_SINGLE = {
        "Ґ"=>"G","Ё"=>"YO","Є"=>"E","Ї"=>"YI","І"=>"I",
        "А"=>"A","Б"=>"B","В"=>"V","Г"=>"G",
        "Д"=>"D","Е"=>"E","Ж"=>"ZH","З"=>"Z","И"=>"I",
        "Й"=>"Y","К"=>"K","Л"=>"L","М"=>"M","Н"=>"N",
        "О"=>"O","П"=>"P","Р"=>"R","С"=>"S","Т"=>"T",
        "У"=>"U","Ф"=>"F","Х"=>"H","Ц"=>"TS","Ч"=>"CH",
        "Ш"=>"SH","Щ"=>"SCH","Ъ"=>"'","Ы"=>"Y","Ь"=>"",
        "Э"=>"E","Ю"=>"YU","Я"=>"YA",
      }

      UPPER_MULTI = {
        "ЬЕ"=>"IE",
        "ЬЁ"=>"IE",
      }

      LOWER = (LOWER_SINGLE.merge(LOWER_MULTI)).freeze
      UPPER = (UPPER_SINGLE.merge(UPPER_MULTI)).freeze
      MULTI_KEYS = (LOWER_MULTI.merge(UPPER_MULTI)).keys.sort_by {|s| s.length}.reverse.freeze

      def self.rule
        lambda do |string|
          chars = string.scan(%r{#{MULTI_KEYS.join '|'}|\w|.})

          result = ""

          chars.each_with_index do |char, index|
            if UPPER.has_key?(char) && LOWER.has_key?(chars[index+1])
              # combined case
              result << UPPER[char].downcase.capitalize
            elsif UPPER.has_key?(char)
              result << UPPER[char]
            elsif LOWER.has_key?(char)
              result << LOWER[char]
            else
              result << char
            end
          end

          result
        end
      end
    end
  end
end

{ :ru => {
    :i18n => {
      :transliterate => {
        :rule => ::RailsI18n::Transliteration::Russian.rule }}}}