# Bosnia and Herzegovina (Bosnian) pluralization rule implementation for rails
# Picked up from https://github.com/svenfuchs/i18n/blob/master/test/test_data/locales/plurals.rb
#
# In order for this to work, add folowing to application.rb
# I18n::Backend::Simple.include(I18n::Backend::Pluralization)

{ :bs => { :i18n => { :plural => { :rule => lambda { |n| n % 10 == 1 && n % 100 != 11 ? :one : [2, 3, 4].include?(n % 10) && ![12, 13, 14].include?(n % 100) ? :few : n % 10 == 0 || [5, 6, 7, 8, 9].include?(n % 10) || [11, 12, 13, 14].include?(n % 100) ? :many : :other } } } } }