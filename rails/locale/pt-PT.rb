# Portuguese localization for Ruby on Rails
# by Ricardo Otero <oterosantos@gmail.com>
{
  :'pt-PT' => {

    # ActiveSupport
    :support => {
      :array => {
        :sentence_connector => 'e',
        :skip_last_comma => true
      }
    },

    :date => {
      :formats => {
        :default      => "%d/%m/%Y",
        :short        => lambda { |date| "#{date.day} %b" },
        :long         => lambda { |date| "#{date.day} de %B de %Y" },
        :only_day     => "%e"
      },
      :day_names => %w(Domingo Segunda Terça Quarta Quinta Sexta Sábado),
      :abbr_day_names => %w(Do Se Te Qa Qi Sx Sa),
      :month_names => [nil] + %w(Janeiro Fevereiro Março Abril Maio Junho Julho Agosto Setembro Outubro Novembro Dezembro),
      :abbr_month_names => [nil] + %w(Jan Fev Mar Abr Mai Jun Jul Ago Set Out Nov Dez),
      :order => [:day, :month, :year]
    },

    :time => {
      :formats => {
        :default      => lambda { |time| "%A, #{time.day} de %B de %Y, %H:%M hs" },
        :short        => lambda { |time| "#{time.day}/%m, %H:%M hs" },
        :long         => lambda { |time| "%A, #{time.day} de %B de %Y, %H:%M hs" },
      },
      :am => '',
      :pm => ''
    },

    # date helper - distância temporal
    :datetime => {
      :distance_in_words => {
        :half_a_minute => 'meio minuto',
        :less_than_x_seconds => {
          :one => 'menos de 1 segundo',
          :other => 'menos de {{count}} segundos'
        },
        :x_seconds => {
          :one => '1 segundo',
          :other => '{{count}} segundos'
        },
        :less_than_x_minutes => {
          :one => 'menos de um minuto',
          :other => 'menos de {{count}} minutos'
        },
        :x_minutes => {
          :one => '1 minuto',
          :other => '{{count}} minutos'
        },
        :about_x_hours => {
          :one => 'aproximadamente 1 hora',
          :other => 'aproximadamente {{count}} horas'
        },
        :x_days => {
          :one => '1 dia',
          :other => '{{count}} dias'
        },
        :about_x_months => {
          :one => 'aproximadamente 1 mês',
          :other => 'aproximadamente {{count}} meses'
        },
        :x_months => {
          :one => '1 mês',
          :other => '{{count}} meses'
        },
        :about_x_years => {
          :one => 'aproximadamente 1 ano',
          :other => 'aproximadamente {{count}} anos'
        },
        :over_x_years => {
          :one => 'mais de 1 ano',
          :other => 'mais de {{count}} anos'
        }
      }
    },

    # formatos de números
    :number => {
      :format => {
        :precision => 3,
        :separator => ',',
        :delimiter => '.',
      },
      :currency => {
        :format => {
          :unit => '€',
          :precision => 2,
          :format => '%u %n',
          :separator => ',',
          :delimiter => '.'
        }
      },
      :percentage => {
        :format => {
          :delimiter => ''
        }
      },
      :precision => {
        :format => {
          :delimiter => ''
        }
      },
      :human => {
        :format => {
          :precision => 1,
          :delimiter => ''
        }
      },
    },

    # Active Record
    :activerecord => {
      :errors => {
        :template => {
          :header => {
            :one => "não foi possível guardar {{model}}: 1 erro",
            :other => "não foi possível guardar {{model}}: {{count}} erros."
          },
          :body => "Por favor, verifique os seguintes campos:"
        },
        :messages => {
          :inclusion => "não está incluído na lista",
          :exclusion => "não está disponível",
          :invalid => "não é válido",
          :confirmation => "não está de acordo com a confirmação",
          :accepted  => "precisa de ser aceite",
          :empty => "não pode estar em branco",
          :blank => "não pode estar em branco",
          :too_long => "tem demasiados caracteres (máximo: {{count}} caracteres)",
          :too_short => "tem poucos caracteres (mínimo: {{count}} caracteres)",
          :wrong_length => "não é do tamanho correcto (necessita de ter {{count}} caracteres)",
          :taken => "não está disponível",
          :not_a_number => "não é um número",
          :greater_than => "tem de ser maior do que {{count}}",
          :greater_than_or_equal_to => "tem de ser maior ou igual a {{count}}",
          :equal_to => "tem de ser igual a {{count}}",
          :less_than => "tem de ser menor do que {{count}}",
          :less_than_or_equal_to => "tem de ser menor ou igual a {{count}}",
          :odd => "tem de ser ímpar",
          :even => "tem de ser par"
        }
      }
    }
  }
}