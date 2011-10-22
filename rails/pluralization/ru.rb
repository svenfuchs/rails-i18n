# -*- encoding: utf-8 -*- 

# Be sure to check out "russian" gem (http://github.com/yaroslav/russian) for
# full Russian language support in Rails (month names, pluralization, etc).
# The following is an excerpt from that gem.
#
# Для полноценной поддержки русского языка (варианты названий месяцев,
# плюрализация и так далее) в Rails 2.2+ и Rails 3 нужно использовать gem "russian"
# (http://github.com/yaroslav/russian). Следующие данные -- выдержка их него, чтобы
# была возможность минимальной локализации приложения на русский язык.

# Правило плюрализации для русского языка, взято из CLDR, http://unicode.org/cldr/
#
# Russian language pluralization rules, taken from CLDR project, http://unicode.org/cldr/
#
#   one -> n mod 10 is 1 and n mod 100 is not 11;
#   few -> n mod 10 in 2..4 and n mod 100 not in 12..14;
#   many -> n mod 10 is 0 or n mod 10 in 5..9 or n mod 100 in 11..14;
#   other -> everything else
#
# Пример
#
#   :one  = 1, 21, 31, 41, 51, 61...
#   :few  = 2-4, 22-24, 32-34...
#   :many = 0, 5-20, 25-30, 35-40...
#   :other = 1.31, 2.31, 5.31...
{
  :ru => {
    :'i18n' => {
      :plural => {
        :rule => lambda { |n| 
          n % 10 == 1 && n % 100 != 11 ? :one : [2, 3, 4].include?(n % 10) && ![12, 13, 14].include?(n % 100) ? :few : n % 10 == 0 || [5, 6, 7, 8, 9].include?(n % 10) || [11, 12, 13, 14].include?(n % 100) ? :many : :other 
        }
      }
    }
  }
}