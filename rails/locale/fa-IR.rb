# Persian translations for Ruby on Rails 
# by Reza (reza@balatarin.com)
# minor tweaks and converting to hash format by Aziz (aziz@balatarin.com)

{
  :'fa-IR' => {
    :date => {
      :formats => {
        :default      => "%Y/%m/%d",
        :short        => "%m/%d",
        :long         => "%e %B %Y",
        :only_day     => "%e"
      },
      :day_names => ["یکشنبه", "دوشنبه", "سه‌شنبه","چهارشنبه", "پنج‌شنبه","جمعه", "شنبه"],
      :abbr_day_names => ["ی", "د", "س", "چ", "پ", "ج", "ش"],
      :month_names => [nil, "ژانویه", "فوریه", "مارس", "آوریل", "مه", "ژوئن", "ژوئیه", "اوت", "سپتامبر", "اکتبر", "نوامبر", "دسامبر"],
      :abbr_month_names => [nil, "ژانویه", "فوریه", "مارس", "آوریل", "مه", "ژوئن", "ژوئیه", "اوت", "سپتامبر", "اکتبر", "نوامبر", "دسامبر"],
      :order => [ :day, :month, :year ]
    },
    :time => {
      :formats => {
        :default      => "%A، %e %B %Y، ساعت %H:%M:%S (%Z)",
        :time         => "%H:%M",
        :short        => "%e %B، ساعت %H:%M",
        :long         => "%e %B %Y، ساعت %H:%M",
      },
      :datetime => {
        :formats => {
          :default => "%A، %e %B %Y، ساعت %H:%M:%S (%Z)"
        }
      },
      :am => "ق.ظ.",
      :pm => "ب.ظ."
    },
    :datetime => {
      :distance_in_words => {
        :half_a_minute       => 'نیم دقیقه',
        :less_than_x_seconds => {:zero => 'کمتر از ۱ ثانیه', :one => '۱ ثانیه', :other => 'کمتر  از {{count}} ثانیه'},
        :x_seconds           => {:one => '۱ ثانیه', :other => '{{count}} ثانیه'},
        :less_than_x_minutes => {:one => 'کمتر از ۱ دقیقه', :other => 'کمتر از {{count}} دقیقه'},
        :x_minutes           => {:one => "۱ دقیقه", :other => "{{count}} دقیقه"},
        :about_x_hours       => {:one => 'حدود ۱ ساعت', :other => 'حدود {{count}} ساعت'},
        :x_days              => {:one => '۱ روز', :other => '{{count}} روز'},
        :about_x_months      => {:one => 'حدود ۱ ماه', :other => 'حدود {{count}} ماه'},
        :x_months            => {:one => '۱ ماه', :other => '{{count}} ماه'},
        :about_x_years       => {:one => 'حدود ۱ سال', :other => 'حدود {{count}} سال'},
        :over_x_years        => {:one => 'بیش از ۱ سال', :other => 'بیش از {{count}} سال'}
      }
    },
    :number => {
      :format => {
        :precision => 2,
        :separator => '٫',
        :delimiter => '٬'
      },
      :currency => {
        :format => {
          :unit      => 'ریال',
          :precision => 0,
          :separator => '٫',
          :delimiter => '٬',
          :format    => '%n %u'
        }
      },
      :human => {
        :format => {
          :delimiter => "",
          :precision => 1
        },
          
        :storage_units => ["بایت", "کیلوبایت", "مگابایت", "گیگابایت", "ترابایت"]
      }
        
    },
    
    :support => {
      :array => {
        :sentence_connector => "و",
        :skip_last_comma => true
      }
    },

  
    # Active Record
    :activerecord => {
      :errors => {
        :template => {
          :header => {
            :one => "۱ خطا جلوی ذخیره این {{model}} را گرفت", 
            :other => "{{count}} خطا جلوی ذخیره این {{model}} را گرفت"
          },
          :body => "موارد زیر مشکل داشت:"
        },
        :messages => {
          :inclusion => "در لیست موجود نیست",
          :exclusion => "رزرو است",
          :invalid => "نامعتبر است",
          :confirmation => "با تایید نمی‌خواند",
          :accepted  => "باید پذیرفته شود",
          :empty => "نمی‌تواند خالی باشد",
          :blank => "نباید خالی باشد",
          :too_long => "بلند است (حداکثر {{count}} کاراکتر)",
          :too_short => "کوتاه است (حداقل {{count}} کاراکتر)",
          :wrong_length => "نااندازه است (باید {{count}} کاراکتر باشد)",
          :taken => "پیشتر گرفته شده",
          :not_a_number => "عدد نیست",
          :greater_than => "باید بزرگتر از {{count}} باشد",
          :greater_than_or_equal_to => "باید بزرگتر یا برابر {{count}} باشد",
          :equal_to => "باید برابر {{count}} باشد",
          :less_than => "باید کمتر از {{count}} باشد",
          :less_than_or_equal_to => "باید کمتر یا برابر {{count}} باشد",
          :odd => "باید فرد باشد",
          :even => "باید زوج باشد", 
          :presence => "را فراموش کرده‌اید",
          :format => "فرمت مشکل دارد"
        }
      }
    }
  }
}
