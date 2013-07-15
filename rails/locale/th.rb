# encoding: utf-8
# More at http://en.wikipedia.org/wiki/Buddhist_calendar
BUDDHIST_CALENDAR_YEAR_OFFSET = 543 unless defined?(BUDDHIST_CALENDAR_YEAR_OFFSET)

{
  th: {
    date: {
      formats: {
        default: lambda { |date, _| "%d-%m-#{date.year + BUDDHIST_CALENDAR_YEAR_OFFSET}" },
        long: lambda { |date, _| "%d %B #{date.year + BUDDHIST_CALENDAR_YEAR_OFFSET}" },
        year: lambda { |date, _| date.year + BUDDHIST_CALENDAR_YEAR_OFFSET },
      }
    },
    time: {
      formats: {
        default: lambda { |time, _| "%a %d %b #{time.year + BUDDHIST_CALENDAR_YEAR_OFFSET} %H:%M:%S %z" },
        long: lambda { |time, _| "%d %B #{time.year + BUDDHIST_CALENDAR_YEAR_OFFSET} %H:%M น." },
      }
    }
  }
}
