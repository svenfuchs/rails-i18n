{
  gd: {
    number: {
      nth: {
        ordinals: -> (_key, number:, **_options) {
          if number.to_i.abs == 1
            'ᵈ'
          elsif number.to_i.abs == 2
            'ⁿᵃ'
          elsif number.to_i.abs == 3
            'ˢ'
          else
            'ᵐʰ'
          end
        },

        ordinalized:  -> (_key, number:, **_options) {
          "#{number}#{ActiveSupport::Inflector.ordinal(number)}"
        }
      }
    }
  }
}
