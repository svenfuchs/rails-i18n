module RailsI18n
  module Pluralization
    module ScottishGaelic
      def self.rule
        lambda do |n|
          return :other unless n.is_a?(Numeric)

          floorn = floor(n)

          if floorn == 1 || floorn == 11
            :one
          elsif floorn == 2 || floorn == 12
            :two
          elsif (3..19).member?(floorn)
            :few
          else
            :other
          end
        end
      end
    end
  end
end

{ :gd => {
    :'i18n' => {
      :plural => {
        :keys => [:one, :few, :many, :other],
        :rule => RailsI18n::Pluralization::ScottishGaelic.rule }}}}
