module RailsI18n
  module Pluralization
    module Hebrew
      def self.rule
        lambda do |n|
          if n == 1
            :one
          else
            :other
          end
        end
      end
    end
  end
end

{ :he => {
    :i18n => {
      :plural => {
        :keys => [:one, :two, :many, :other],
        :rule => RailsI18n::Pluralization::Hebrew.rule }}}}