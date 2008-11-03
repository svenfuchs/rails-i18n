{
  :'es-AR' => {

    :date => {
      :formats => {
        :default      => "%e/%m/%Y",
        :short        => "%e %b",
        :long         => "%e de %B de %Y",
        :only_day     => "%e"
      },
      :day_names      => %w(Domingo Lunes Martes Miércoles Jueves Viernes Sábado),
      :abbr_day_names => %w(Dom Lun Mar Mie Jue Vie Sab),
      :month_names    => [nil] + %w(Enero Febrero Marzo Abril Mayo Junio Julio Agosto Setiembre Octubre Noviembre Diciembre),
      :abbr_month_names => [nil] + %w(Ene Feb Mar Abr May Jun Jul Ago Set Oct Nov Dic),
      :order          => [:day, :month, :year]
    },
    :time => {
      :formats => {
        :default      => "%A, %e de %B de %Y, %H:%M hs",
        :time         => "%H:%M hs",
        :short        => "%e/%m, %H:%M hs",
        :long         => "%A, %e de %B de %Y, %H:%M hs",
        :only_second  => "%S"
      },
      :datetime => {
        :formats => {
          :default => "%d/%m/%Y-%dT%H:%M:%S%Z"
        }
      },
      :time_with_zone => {
        :formats => {
          :default => lambda { |time| "%Y-%m-%d %H:%M:%S #{time.formatted_offset(false, 'UTC')}" }
        }
      },
      :am => 'am',
      :pm => 'pm'
    },
    # date helper distancia en palabras
    #NOTE: Pluralization rules have changed! Rather than simply submitting an array, i18n now allows for a hash with the keys:
    # :zero, :one & :other   - FUNKY (but a pain to find...)!
    :datetime => {
      :distance_in_words => {
        :half_a_minute       => 'medio minuto',
        :less_than_x_seconds => {:zero => 'menos de 1 segundo', :one => 'menos de 1 segundo', :other => 'menos de {{count}} segundos'},
        :x_seconds           => {:one => '1 second', :other => '{{count}} seconds'},
        :less_than_x_minutes => {:zero => 'menos de 1 minuto', :one => 'menos de 1 minuto', :other => 'menos de {{count}} minutos'},
        :x_minutes           => {:one => "1 minuto", :other => "{{count}} minutos"},
        :about_x_hours       => {:one => 'aproximadamente 1 hora', :other => 'aproximadamente {{count}} horas'},
        :x_days              => {:one => '1 día', :other => '{{count}} días'},
        :about_x_months      => {:one => 'aproximandamente 1 mes', :other => 'aproximadamente {{count}} mes'},
        :x_months            => {:one => '1 month', :other => '{{count}} mes'},
        :about_x_years       => {:one => 'aproximadamente 1 año', :other => 'aproximadamente {{count}} años'},
        :over_x_years        => {:one => 'más de 1 año', :other => 'más de {{count}} años'}
      }
    },

    # numbers
    :number => {
      :format => {
        :precision => 3,
        :separator => ',',
        :delimiter => '.'
      },
      :currency => {
        :format => {
          :unit => '$',
          :precision => 2,
          :format => '%u %n'
        }
      }
    },

    # Active Record
    :activerecord => {
      :errors => {
        :template => {
          :header => {
            :one => "{{model}} no pudo guardarse: 1 error", 
            :other => "{{model}}: {{count}} errores."
          },
          :body => "Por favor revise los campos siguientes:"
        },
        :messages => {
          :inclusion => "no está incluido en la lista",
          :exclusion => "no está disponible",
          :invalid => "no es válido",
          :confirmation => "no coincide con la confirmación",
          :accepted  => "debe ser aceptado",
          :empty => "no puede estar vacío",
          :blank => "no puede estar en blanco",
          :too_long => "es demasiado largo (no más de {{count}} caracteres)",
          :too_short => "es demasiado corto (no menos de {{count}} caracteres)",
          :wrong_length => "no tiene la longitud correcta (debe ser de {{count}} caracteres)",
          :taken => "no está disponible",
          :not_a_number => "no es un número",
          :greater_than => "debe ser mayor a {{count}}",
          :greater_than_or_equal_to => "debe ser mayor o igual a {{count}}",
          :equal_to => "debe ser igual a {{count}}",
          :less_than => "debe ser menor que {{count}}",
          :less_than_or_equal_to => "debe ser menor o igual que {{count}}",
          :odd => "debe ser par",
          :even => "debe ser impar"
        }
      }
    }
  }
}
