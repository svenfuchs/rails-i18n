# Originally was implemented by Yaroslav Markin in "russian" gem
# (http://github.com/yaroslav/russian)
#
# Used for Belarusian, Bosnian, Croatian, Russian, Serbian, Serbo-Croatian, Ukrainian.

module RailsI18n
  module Pluralization
    module EastSlavic
      def self.rule
        lambda do |n|
          mod10 = n % 10
          mod100 = n % 100

          if mod10 == 1 && mod100 != 11
            :one
          elsif [2, 3, 4].include?(mod10) && ![12, 13, 14].include?(mod100)
            :few
          elsif mod10 == 0 || (5..9).to_a.include?(mod10) || (11..14).to_a.include?(mod100)
            :many
          else
            :other
          end
        end
      end

      def self.with_locale(locale)
        { locale => {
            :'i18n' => {
              :plural => {
                :keys => [:one, :few, :many, :other],
                :rule => rule }}}}
      end
    end
  end
end
