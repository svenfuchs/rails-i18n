{ 
  :'ja' => {
    # date and time formats
    :date => {
      :formats => {
        :default      => "%Y-%m-%d",
        :short        => "%e %b",
        :long         => "%B %e, %Y",
        :long_ordinal => lambda { |date| "%B #{date.day}, %Y" },
        :only_day     => "%e"
      },
      :day_names => %w(日曜日 月曜日 火曜日 水曜日 木曜日 金曜日 土曜日),
      :abbr_day_names => %w(日 月 火 水 木 金 土),
      :month_names => [nil] + %w(1月 2月 3月 4月 5月 6月 7月 8月 9月 10月 11月 12月),
      :abbr_month_names => [nil] + %w(1月 2月 3月 4月 5月 6月 7月 8月 9月 10月 11月 12月),
      :order => [:year, :month, :day]
    },
    :time => {
      :formats => {
        :default      => "%a %b %d %H:%M:%S %Z %Y",
        :time         => "%H:%M",
        :short        => "%d %b %H:%M",
        :long         => "%B %d, %Y %H:%M",
        :long_ordinal => lambda { |time| "%B #{time.day}, %Y %H:%M" },
        :only_second  => "%S"
      },
      :am => '',
      :pm => ''
    },

    # date helper distance in words
    :datetime => {
      :distance_in_words => {
        :half_a_minute       => '30分',
        :less_than_x_seconds => '{{count}} 秒以下',
        :x_seconds           => '{{count}} 秒',
        :less_than_x_minutes => '{{count}} 分以下',
        :x_minutes           => '{{count}} 分',
        :about_x_hours       => '約 {{count}} 時間',
        :x_days              => '{{count}} 日',
        :about_x_months      => '約 {{count}} ヶ月',
        :x_months            => '{{count}} ヶ月',
        :about_x_years       => '約　{{count}} 年',
        :over_x_years        => '{{count}} 年以上'
      }
    },

    # numbers
    :number => {
      :format => {
        :precision => 3,
        :separator => '.',
        :delimiter => ','
      },
      :currency => {
        :format => {
          :unit => '¥',
          :precision => 2,
          :format => '%u%n'
        }
      }
    },

    # Active Record
    :active_record => {
      :error => {
        :header_message => ["保存できませんでした {{object_name}}: 1 エラー", "保存できませんでした {{object_name}}: {{count}} エラー."],
        :message => "以下のメッセージを確認してください:"
      }
    },
    :active_record => {
      :error_messages => {
        :inclusion => "は、リストに含まれていません",
        :exclusion => "は、有効な値ではありません",
        :invalid => "は、妥当な値ではありません",
        :confirmation => "は、確認できません",
        :accepted  => "は、入力できません",
        :empty => "何も入力されていません",
        :blank => "空白です",
        :too_long => "長すぎます ({{count}}文字以下)",
        :too_short => "短すぎます ({{count}}文字以上)",
        :wrong_length => "桁数が合っていません({{count}}桁必要です)",
        :taken => "有効ではありません",
        :not_a_number => "数字ではありません",
        :greater_than => "{{count}}文字を超えて入力されています",
        :greater_than_or_equal_to => "{{count}}文字以上入力されています",
        :equal_to => "{{count}}と同値です",
        :less_than => "{{count}}文字未満です",
        :less_than_or_equal_to => "{{count}}文字以下で入力されています",
        :odd => "端数が入力されています",
        :even => "偶数が入力されています"
      }
    }
  }
}