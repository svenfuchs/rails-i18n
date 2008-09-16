{
  :"no-BM" => {
    :support => {
      :array => {
        :sentence_connector => "og"
      }
    },
    :date => {
      :formats => {
        :default => "%Y-%m-%d",
        :short => "%b %d",
        :long => "%B %d, %Y",
        :only_day => "%e"
      },
      :day_names => Date::DAYNAMES,
      :abbr_day_names => Date::ABBR_DAYNAMES,
      :month_names => Date::MONTHNAMES,
      :abbr_month_names => Date::ABBR_MONTHNAMES,
      :order => [:year, :month, :day]
    },
    :time => {
      :formats => {
        :default => "%a, %d %b %Y %H:%M:%S %z",
        :short => "%d %b %H:%M",
        :long => "%B %d, %Y %H:%M",
        :only_second  => "%S"
      },
      :am => "am",
      :pm => "pm"
    },
    :datetime => {
      :distance_in_words => {
        :half_a_minute => "et halvt minutt",
        :less_than_x_seconds => ["mindre enn 1 sekund", "mindre enn {{count}} sekunder"],
        :x_seconds => ["1 sekund", "{{count}} sekunder"],
        :less_than_x_minutes => ["mindre enn 1 minutt", "mindre enn {{count}} minutter"],
        :x_minutes => ["1 minutt", "{{count}} minutter"],
        :about_x_hours => ["ca. 1 time", "ca. {{count}} timer"],
        :x_days => ["1 dag", "{{count}} dager"],
        :about_x_months => ["ca. 1 måned", "ca. {{count}} måneder"],
        :x_months => ["1 måned", "{{count}} måneder"],
        :about_x_years => ["ca. 1 år", "ca. {{count}} år"],
        :over_x_years => ["over 1 år", "over {{count}} år"]
      }
    },
    :number => {
      :format => {
        :precision => 3,
        :separator => ".",
        :delimiter => ","
      },
      :currency => {
        :format => {
          :unit => "$",
          :precision => 2,
          :format => "%u%n"
        }
      },
      :human => {
        :format => {
          :precision => 1,
          :delimiter => ""
        }
      },
      :percentage => {
        :format => {
          :delimiter => ""
        }
      },
      :precision => {
        :format => {
          :delimiter => ""
        }
      }
    },
    :active_record => {
      :error => {
        :header_message => ["1 feil forbød {{object_name}} fra å bli lagret", "{{count}} feil forbød {{object_name}} fra å bli lagret"],
        :message => "det oppstod problemer i følgende felt:"
      }
    },
    :active_record => {
      :error_messages => {
        :inclusion => "er ikke inkludert i listen",
        :exclusion => "er reservert",
        :invalid => "er ugyldig",
        :confirmation => "passer ikke bekreftelsen",
        :accepted => "må være akseptert",
        :empty => "kan ikke være tom",
        :blank => "kan ikke være blank",
        :too_long => "er for lang (maksimum {{count}} tegn)",
        :too_short => "er for kort (minimum {{count}} tegn)",
        :wrong_length => "er av feil lengde (maksimum {{count}} tegn)",
        :taken => "er allerede tatt",
        :not_a_number => "er ikke et nummer",
        :greater_than => "må være større enn {{count}}",
        :greater_than_or_equal_to => "må være større enn eller lik {{count}}",
        :equal_to => "må være lik {{count}}",
        :less_than => "må være mindre enn {{count}}",
        :less_than_or_equal_to => "må være mindre enn eller lik {{count}}",
        :odd => "må være oddetall",
        :even => "må være partall"
      }
    }
  }
}