{
  oc: {
    number: {
      nth: {
        ordinals: -> (_key, number:, **_options) {
          case number.to_i.abs
          when 1
            'èr'
          when 2
            'nd'
          else
            'en'
          end
        },

        ordinalized:  -> (_key, number:, **_options) {
          "#{number}#{ActiveSupport::Inflector.ordinal(number)}"
        }
      }
    }
  }
}
