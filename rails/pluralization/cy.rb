require 'rails_i18n/pluralization'

{ :cy => {
    :'i18n' => {
      :plural => {
        :keys => [:zero, :one, :two, :few, :many, :other],
        :rule => RailsI18n::Pluralization::Welsh.rule }}}}
