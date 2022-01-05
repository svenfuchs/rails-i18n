module RailsI18n
  module Pluralization
    module Serbian
      def self.rule
        lambda do |n|
          n ||= 0
          mod10 = n % 10
          mod100 = n % 100

          if mod10 == 1 && mod100 != 11
            :one
          elsif from_2_to_4.include?(mod10) && !from_12_to_14.include?(mod100)
            :few
          else
            :other
          end
        end
      end

      private

      def self.from_2_to_4
        @from_2_to_4 ||= (2..4).to_a.freeze
      end

      def self.from_12_to_14
        @from_12_to_14 ||= (12..14).to_a.freeze
      end
    end
  end
end

{ :sr => {
  :i18n => {
    :plural => {
      :keys => [:one, :few, :other],
      :rule => RailsI18n::Pluralization::Serbian.rule }}}}
