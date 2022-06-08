module RailsI18n
  module Pluralization
    module Serbian
      FROM_2_TO_4   = (2..4).to_a.freeze
      FROM_12_TO_14 = (12..14).to_a.freeze

      def self.rule
        lambda do |n|
          n ||= 0
          mod10 = n % 10
          mod100 = n % 100

          if mod10 == 1 && mod100 != 11
            :one
          elsif FROM_2_TO_4.include?(mod10) && !FROM_12_TO_14.include?(mod100)
            :few
          else
            :other
          end
        end
      end

      def self.with_locale(locale)
          { locale => {
              :i18n => {
                :plural => {
                  :keys => [:one, :few, :other],
                  :rule => rule }}}}
      end
    end
  end
end