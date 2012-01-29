module RailsI18n
  module Pluralization
    module Langi
      def self.rule
        lambda do |n|
          if n == 0
            :zero
          elsif (0...2).cover?(n)
            :one
          else
            :other
          end
        end
      end
    end
  end
end

{ :lag => {
    :'i18n' => {
      :plural => {
        :keys => [:zero, :one, :other],
        :rule => RailsI18n::Pluralization::Langi.rule }}}}