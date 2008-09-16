# Norwegian, bokmål (book language) translations for Ruby on Rails
# by Johann Manaf Tepstad (jsha@adopt-a-camel.com)

{
  :"no-BM" => {
    :support => {
      :array => {
        :sentence_connector => "og"
      }
    },
    :date => {
      :formats => {
        :default => "%d.%m.%Y",
        :short => "%e. %b",
        :long => "%e. %B %Y",
      },
      :day_names => %w(mandag tirsdag onsdag torsdag fredag lørdag søndag),
      :abbr_day_names => %w(man tir ons tor fre lør søn),
      :month_names => %w(januar februar mars april mai juni juli august september oktober november desember),
      :abbr_month_names => %w(jan feb mar apr mai jun jul aug sep okt nov des),
      :order => [:day, :month, :year]
    },
    :time => {
      :formats => {
        :default => "%A, %e. %B %Y, %H:%M",
        :time => "%H:%M",
        :short => "%e. %B, %H:%M",
        :long => "%A, %e. %B %Y, %H:%M",
      }
    },
    :datetime => {
      :distance_in_words => {
        :half_a_minute => "et halvt minutt",
        :less_than_x_seconds => ["mindre enn 1 sekund", "mindre enn {{count}} sekunder"],
        :x_seconds => ["1 sekund", "{{count}} sekunder"],
        :less_than_x_minutes => ["mindre enn 1 minutt", "mindre enn {{count}} minutter"],
        :x_minutes => ["1 minutt", "{{count}} minutter"],
        :about_x_hours => ["omtrent 1 time", "omtrent {{count}} timer"],
        :x_days => ["1 dag", "{{count}} dager"],
        :about_x_months => ["omtrent 1 måned", "omtrent {{count}} måneder"],
        :x_months => ["1 måned", "{{count}} måneder"],
        :about_x_years => ["omtrent 1 år", "omtrent {{count}} år"],
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
          :unit => "kr",
          :precision => 2,
          :format => "%u %n"
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
