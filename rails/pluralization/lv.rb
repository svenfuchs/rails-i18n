module RailsI18n
  module Pluralization
    module Latvian
      def self.rule
        lambda do |n|
          if n == 0
            :zero
          elsif n % 10 == 1 && n % 100 != 11
            :one
          else
            :other
          end
        end
      end
    end
  end
end

{ :lv => {
    :'i18n' => {
      :plural => {
        :keys => [:zero, :one, :other],
        :rule => RailsI18n::Pluralization::Latvian.rule }}}}