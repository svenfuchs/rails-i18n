RailsI18n::ExampleGroups.module_eval do
  group "number_to_currency" do |g|
    g.example "1234" do
      number_to_currency(1234)
    end
    
    g.example "1234.9" do
      number_to_currency(1234.9)
    end
    
    g.example "1234567.89012" do
      number_to_currency(1234567.89012)
    end
  end
  
  group "number_to_percentage" do |g|
    g.example "1234" do
      number_to_percentage(1234)
    end
    
    g.example "1234.9" do
      number_to_percentage(1234.9)
    end
    
    g.example "1234567.89012" do
      number_to_percentage(1234567.89012)
    end
  end
  
  group "number_with_delimiter" do |g|
    g.example "1234" do
      number_with_delimiter(1234)
    end
    
    g.example "1234.9" do
      number_with_delimiter(1234.9)
    end
    
    g.example "1234567.89012" do
      number_with_delimiter(1234567.89012)
    end
  end
  
  group "number_with_precision" do |g|
    g.example "1234" do
      number_with_precision(1234)
    end
    
    g.example "1234.56" do
      number_with_precision(1234.56)
    end
    
    g.example "1234567.89012" do
      number_with_precision(1234567.89012)
    end
  end
  
  group "number_to_human_size" do |g|
    g.example "123" do
      number_to_human_size(123)
    end
    
    g.example "1234" do
      number_to_human_size(1234)
    end
    
    g.example "12345" do
      number_to_human_size(12345)
    end
    
    g.example "1234567" do
      number_to_human_size(1234567)
    end
    
    g.example "1234567890" do
      number_to_human_size(1234567890)
    end
    
    g.example "1234567890123" do
      number_to_human_size(1234567890123)
    end
  end
  
  @@time = Time.mktime(2004, 6, 6, 21, 45, 0)
  
  group "time_ago_in_words" do |g|
    g.example "0 seconds ago" do
      time_ago_in_words(0.seconds.ago)
    end

    g.example "1 seconds ago" do
      time_ago_in_words(1.seconds.ago)
    end

    g.example "30 seconds ago" do
      time_ago_in_words(30.seconds.ago)
    end

    g.example "59 seconds ago" do
      time_ago_in_words(59.seconds.ago)
    end

    g.example "60 seconds minute ago" do
      time_ago_in_words(60.seconds.ago)
    end

    g.example "90 seconds ago" do
      time_ago_in_words(90.seconds.ago)
    end

    g.example "119 seconds ago" do
      time_ago_in_words(119.seconds.ago)
    end

    g.example "120 seconds ago" do
      time_ago_in_words(120.seconds.ago)
    end

    g.example "30 minutes ago" do
      time_ago_in_words(30.minutes.ago)
    end

    g.example "59 minutes ago" do
      time_ago_in_words(30.minutes.ago)
    end

    g.example "1 hour ago" do
      time_ago_in_words(1.hour.ago)
    end

    g.example "1.5 hours ago" do
      time_ago_in_words(1.5.hours.ago)
    end

    g.example "2 hours ago" do
      time_ago_in_words(2.hours.ago)
    end

    g.example "23 hours ago" do
      time_ago_in_words(23.hours.ago)
    end

    g.example "1 day ago" do
      time_ago_in_words(1.day.ago)
    end

    g.example "30 days ago" do
      time_ago_in_words(30.days.ago)
    end

    g.example "60 days ago" do
      time_ago_in_words(60.days.ago)
    end

    g.example "1 year ago" do
      time_ago_in_words(1.year.ago)
    end

    g.example "3 years ago" do
      time_ago_in_words(3.years.ago)
    end
  end
  
  group "date/time selects" do |g|
    g.example "select_date(nil)" do # TODO does this use :order implicitely?
      select_date(nil)
    end
    
    g.example "select_day(nil, :prompt => true)" do
      select_day(nil, :prompt => true)
    end
    
    g.example "select_month(nil, :prompt => true)" do
      select_month(nil, :prompt => true)
    end
    
    g.example "select_month(nil, :use_month_numbers => true)" do
      select_month(nil, :use_month_numbers => true)
    end
    
    g.example "select_month(nil, :add_month_numbers => true)" do
      select_month(nil, :add_month_numbers => true)
    end
    
    g.example "select_month(nil, :use_short_month => true)" do
      select_month(nil, :use_short_month => true)
    end
    
    g.example "select_month(nil, :add_month_numbers => true, :use_short_month => true)" do
      select_month(nil, :add_month_numbers => true, :use_short_month => true)
    end
    
    g.example "select_year(nil, :prompt => true)" do
      select_year(nil, :prompt => true)
    end
    
    g.example "select_time(nil)" do
      select_time(nil)
    end
    
    g.example "select_time(nil, :prompt => true)" do
      select_time(nil, :prompt => true)
    end
    
    g.example "select_hour(nil, :prompt => true)" do
      select_hour(nil, :prompt => true)
    end
    
    g.example "select_minute(nil, :prompt => true)" do
      select_hour(nil, :prompt => true)
    end
    
    g.example "select_second(nil, :prompt => true)" do
      select_second(nil, :prompt => true)
    end
    
    g.example "select_datetime(nil)" do
      select_datetime(nil)
    end
    
    g.example "select_datetime(nil, :prompt => true)" do
      select_datetime(nil, :prompt => true)
    end
    
    g.example "date_select(Object.new, :date_field)" do
      date_select(Object.new, :date_field)
    end
    
    g.example "date_select(Object.new, :date_field, :prompt => true)" do
      date_select(Object.new, :date_field, :prompt => true)
    end
    
    g.example "time_select(Object.new, :time_field)" do
      time_select(Object.new, :time_field)
    end
    
    g.example "time_select(Object.new, :time_field, :prompt => true)" do
      time_select(Object.new, :time_field, :prompt => true)
    end
    
    g.example "datetime_select(Object.new, :time_field)" do
      datetime_select(Object.new, :date_or_time_field)
    end
    
    g.example "datetime_select(Object.new, :time_field, :prompt => true)" do
      datetime_select(Object.new, :date_or_time_field, :prompt => true)
    end
  end
  
  # group "date formats (Rails)" do |g|
  #   g.example "Date.today.to_s" do
  #     Date.today.to_s
  #   end
  # 
  #   g.example "Date.today.to_s(:default)" do
  #     Date.today.to_s(:default)
  #   end
  # 
  #   g.example "Date.today.to_s(:short)" do
  #     Date.today.to_s(:short)
  #   end
  # 
  #   g.example "Date.today.to_s(:long)" do
  #     Date.today.to_s(:long)
  #   end
  # 
  #   g.example "Date.today.to_s(:long_ordinal)" do
  #     Date.today.to_s(:long_ordinal)
  #   end
  # 
  #   g.example "Date.today.to_s(:only_day)" do
  #     Date.today.to_s(:only_day)
  #   end
  # end
  
  group "date formats (I18n)" do |g|
    g.example "I18n.l(Date.today)" do
      I18n.l(Date.today)
    end

    g.example "I18n.l(Date.today, :format => :default)" do
      I18n.l(Date.today, :format => :default)
    end

    g.example "I18n.l(Date.today, :format => :short)" do
      I18n.l(Date.today, :format => :short)
    end

    g.example "I18n.l(Date.today, :format => :long)" do
      I18n.l(Date.today, :format => :long)
    end

    g.example "I18n.l(Date.today, :format => :long_ordinal)" do
      I18n.l(Date.today, :format => :long_ordinal)
    end

    g.example "I18n.l(Date.today, :format => :only_day)" do
      I18n.l(Date.today, :format => :only_day)
    end
  end
  
  # group "time formats (Rails)" do |g|
  #   g.example "Time.now.to_s" do
  #     Time.now.to_s
  #   end
  # 
  #   g.example "Time.now.to_s(:default)" do
  #     Time.now.to_s(:default)
  #   end
  # 
  #   g.example "Time.now.to_s(:short)" do
  #     Time.now.to_s(:short)
  #   end
  # 
  #   g.example "Time.now.to_s(:long)" do
  #     Time.now.to_s(:long)
  #   end
  # 
  #   g.example "Time.now.to_s(:long_ordinal)" do
  #     Time.now.to_s(:long_ordinal)
  #   end
  # 
  #   g.example "Time.now.to_s(:only_second)" do
  #     Time.now.to_s(:only_second)
  #   end
  # end
  
  group "time formats (I18n)" do |g|
    g.example "I18n.l(Time.now)" do
      I18n.l(Time.now)
    end

    g.example "I18n.l(Time.now, :format => :default)" do
      I18n.l(Time.now, :format => :default)
    end

    g.example "I18n.l(Time.now, :format => :short)" do
      I18n.l(Time.now, :format => :short)
    end

    g.example "I18n.l(Time.now, :format => :long)" do
      I18n.l(Time.now, :format => :long)
    end

    g.example "I18n.l(Time.now, :format => :long_ordinal)" do
      I18n.l(Time.now, :format => :long_ordinal)
    end

    g.example "I18n.l(Time.now, :format => :only_second)" do
      I18n.l(Time.now, :format => :only_second)
    end
  end
end