require 'rails_i18n/pluralization'

{ :is => {
    :'i18n' => {
      :plural => {
        :keys => [:one, :other],
        :rule => ::RailsI18n::Pluralization::Icelandic.rule }}}}
