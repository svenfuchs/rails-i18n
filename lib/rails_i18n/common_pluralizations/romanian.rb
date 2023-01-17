# Used for Moldavian, Romanian.

module RailsI18n
  module Pluralization
    module Romanian
      FEW = (1..19).to_a
      private_constant :FEW

      def self.rule
        lambda do |n|
          n = n.to_d
          if n == 1
            :one
          elsif n == 0 || FEW.include?(n % 100)
            :few
          else
            :other
          end
        end
      end

      def self.with_locale(locale)
        { locale => {
            :'i18n' => {
              :plural => {
                :keys => [:one, :few, :other],
                :rule => rule }}}}
      end
    end
  end
end
