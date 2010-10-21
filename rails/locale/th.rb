# Thai translation for Ruby on Rails
# original by Prem Sichanugrist (s@sikachu.com/sikandsak@gmail.com)
# activerecord keys fixed by Jittat Fakcharoenphol (jittat@gmail.com)
#
# Note: You must install i18n gem in order to use this language pack.
# If you're calling I18n.localize(Time.now), the year will be in Bhuddhist calendar

{
  :'th' => {
    :number => {
      # Used in number_with_delimiter()
      # These are also the defaults for 'currency', 'percentage', 'precision', and 'human'
      :format => {
        # Sets the separator between the units, for more precision (e.g. 1.0 / 2.0 == 0.5)
        :separator => ".",
        # Delimets thousands (e.g. 1,000,000 is a million) (always in groups of three)
        :delimiter => ",",
        # Number of decimals, behind the separator (the number 1 with a precision of 2 :gives => 1.00)
        :precision => 3
      },
      
      # Used in number_to_currency()
      :currency => {
        :format => {
          # Where is the currency sign? %u is the currency unit, %n the number :(default => $5.00)
          :format => "%n %u",
          :unit => "บาท",
          # These three are to override number.format and are optional
          :separator => ".",
          :delimiter => ",",
          :precision => 2
        }
      },
        
      # Used in number_to_percentage()
      :percentage => {
        :format => {
          # These three are to override number.format and are optional
          # :separator => ".",
          :delimiter => "",
          # :precision => 3
        }
      },
        
      # Used in number_to_precision()
      :precision => {
        :format => {
          # These three are to override number.format and are optional
          # :separator => ".",
          :delimiter => "",
          # :precision => 3
        }
      },
        
      # Used in number_to_human_size()
      :human => {
        :format => {
          # These three are to override number.format and are optional
          # :separator => ".",
          :delimiter => ",",
          :precision => 1
        },
        
        :storage_units => {
          # Storage units output formatting.
          # %u is the storage unit, %n is the number :(default => 2 MB)
          :format => "%n %u",
          :units => {
            :byte => {
              :one =>   "Byte",
              :other => "Bytes"
            },
            :kb => "KB",
            :mb => "MB",
            :gb => "GB",
            :tb => "TB"
          }
        }
      }
    },

    # Used in distance_of_time_in_words(), distance_of_time_in_words_to_now(), time_ago_in_words()
    :datetime => {
      :distance_in_words => {
        :half_a_minute => "ครึ่งนาที",
        :less_than_x_seconds => "น้อยกว่า %{count} วินาที",
        :x_seconds => "%{count} วินาที",
        :less_than_x_minutes => "น้อยกว่า %{count} นาที",
        :x_minutes => "%{count} นาที",
        :about_x_hours => "ประมาณ %{count} ชั่วโมง",
        :x_days => "%{count} วัน",
        :about_x_months => "ประมาณ %{count} เดือน",
        :x_months => "%{count} เดือน",
        :about_x_years => "ประมาณ %{count} ปี",
        :over_x_years => "มากกว่า %{count} ปี",
        :almost_x_years => "เกือบ %{count} ปี",
      },
      :prompts => {
        :year =>   "ปี",
        :month =>  "เดือน",
        :day =>    "วัน",
        :hour =>   "ชั่วโมง",
        :minute => "นาที",
        :second => "วินาที",
      }
    },

    :activemodel => {
      :errors => {
        :template => {
          :header => "พบข้อผิดพลาด %{count} ประการ ทำให้ไม่สามารถบันทึก%{model}ได้",
          # The variable :count is also available
          :body => "โปรดตรวจสอบข้อมูลต่อไปนี้:"
        }
      }
    },
        
    :activerecord => {
      :errors => {
        # The values :model, :attribute and :value are always available for interpolation
        # The value :count is available when applicable. Can be used for pluralization.
        :messages => {
          :inclusion => "ไม่ได้อยู่ในรายการ",
          :exclusion => "ไม่อนุญาตให้ใช้",
          :invalid => "ไม่ถูกต้อง",
          :confirmation => "ไม่ตรงกับการยืนยัน",
          :accepted => "ต้องถูกยอมรับ",
          :empty => "ต้องไม่เว้นว่างเอาไว้",
          :blank => "ต้องไม่เว้นว่างเอาไว้",
          :too_long => "ยาวเกินไป (ต้องไม่เกิน %{count} ตัวอักษร)",
          :too_short => "สั้นเกินไป (ต้องยาวกว่า %{count} ตัวอักษร)",
          :wrong_length => "มีความยาวไม่ถูกต้อง (ต้องมีความยาว %{count} ตัวอักษร)",
          :taken => "ถูกใช้ไปแล้ว",
          :not_a_number => "ไม่ใช่ตัวเลข",
          :greater_than => "ต้องมากกว่า %{count}",
          :greater_than_or_equal_to => "ต้องมากกว่าหรือเท่ากับ %{count}",
          :equal_to => "ต้องมีค่าเท่ากับ %{count}",
          :less_than => "ต้องมีค่าน้อยกว่า %{count}",
          :less_than_or_equal_to => "ต้องมีค่าน้อยกว่าหรือเท่ากับ %{count}",
          :odd => "ต้องเป็นจำนวนคี่",
          :even => "ต้องเป็นจำนวนคู่",
          :record_invalid => "ไม่ผ่านการตรวจสอบ: %{errors}"
          # Append your own errors here or at the model/attributes scope.
        },

        # You can define own errors for models or model attributes.
        # The values :model, :attribute and :value are always available for interpolation.
        #
        # For example,
        #   :models =>
        #     :user =>
        #       :blank => "This is a custom blank message for :%{model} => %{attribute}"
        #       :attributes =>
        #         :login =>
        #           :blank => "This is a custom blank message for User login"
        # Will define custom blank validation message for User model and 
        # custom blank validation message for login attribute of User model.
        # models => {
        # 
        # },
      },
        
      # Translate model names. Used in Model.human_name().
      # :models => {
      #   For example,
      #   :user => "Dude"
      #   will translate User model name to "Dude"
      # },
    
      # Translate model attribute names. Used in Model.human_attribute_name(attribute).
      # :attributes => {
      #   For example,
      #     :user =>
      #       :login => "Handle"
      #   will translate User attribute "login" as "Handle"
      # },
    },

    :date => {
      :formats => {
        # Use the strftime parameters for formats.
        # When no format has been given, it uses default.
        # You can provide other formats here if you like!
        :default => lambda { |date, opts| "%d-%m-#{date.year + 543}" },
        :short => "%e %b",
        :long => lambda { |date, opts| "%e %B #{date.year + 543}" },
      },
      
      :day_names => ["อาทิตย์", "จันทร์", "อังคาร", "พุธ", "พฤหัสบดี", "ศุกร์", "เสาร์"],
      :abbr_day_names => ["อา", "จ", "อ", "พ", "พฤ", "ศ", "ส"],
      
      # Don't forget the nil at the beginning; there's no such thing as a 0th month
      :month_names => [nil, "มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน", "กรกฎาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม"],
      :abbr_month_names => [nil, "ม.ค.", "ก.พ.", "มี.ค.", "เม.ย.", "พ.ค.", "มิ.ย.", "ก.ค.", "ส.ค.", "ก.ย.", "ต.ค.", "พ.ย.", "ธ.ค."],
      # Used in date_select and datime_select.
      :order => [ :day, :month, :year ]
    },

    :time => {
      :formats => {
        :default => lambda { |date, opts| "%a %d %b #{date.year + 543} %H:%M:%S %z" },
        :short => "%e %b %H:%M น.",
        :long => lambda { |date, opts| "%e %B #{date.year + 543} %H:%M น." },
      },
      :am => "",
      :pm => "",
    },
      
    # Used in array.to_sentence.
    :support => {
      :array => {
        :words_connector => ", ",
        :two_words_connector => " และ ",
        :last_word_connector => ", และ ",
      },
      :select => {
        # default value for :prompt => true in FormOptionsHelper
        :prompt => "โปรดเลือก"
      }
    }
  }
}
