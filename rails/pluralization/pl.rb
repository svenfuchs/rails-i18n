module RailsI18n
  module Pluralization
    module Polish
      def self.rule
        lambda do |n|
          n ||= 0
          mod10 = n % 10
          mod100 = n % 100

          if n == 1
            :one
          elsif [2, 3, 4].include?(mod10) && ![12, 13, 14].include?(mod100)
            :few
          else
            :many
          end
        end
      end
    end
  end
end

{ :pl => {
    :'i18n' => {
      :plural => {
        :keys => [:one, :few, :many, :other],
        :rule => RailsI18n::Pluralization::Polish.rule }}}}
