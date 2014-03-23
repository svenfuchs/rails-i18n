## 4.0.2 (2014-03-23)
 - Complete French translation (fr)
 - Make East Slavic pluralization faster
 - Update Upper Sorbian translation (dsb)
 - Add new locale Spanish for Ecuador (es-EC)
 - Update German translation for Switzerland (de-CH)
 - Update Hebrew translation (he)
 - Change currency for Latvian (lv)
 - Use two letter week day abbreviations for Dutch (nl)
 - Update Arabic translation (ar)
 - Update Hungarian translation (hu)
 - Change currency for Ireland (en-IE)
 - Update Ukrainian translation (uk)
 - Add Papiamento/Curaçao translation (pap-CW)
 - Add Cantonese translation (zh-YUE)
 - Update Portugese translation for Brazil (pt-BR)
 - Update Tagalog translation (tl)
 - Update English translation for India (en-IN)
 - Update Lithuanian translation (lt)
 - Update date formats for Finnish (fi)

## 4.0.1 (2013-12-19)
 - Fix typos, formats and delimiters for Swiss-German (iso-639-2/gsw-CH)
 - Add missing keys to Dutch (nl)
 - Fix translations for Lithuanian (lt)
 - Add Spanish/Panama (es-PA)
 - Add Urdu (ur)
 - Remove whitespace between attribute and message in Chinese (zh-CN)
 - Support Rails 4.1.0.beta1

## 4.0.0 (2013-10-05)
 - Fix values of 'restrict_dependent_destroy' key for many languages
 - Fix currency separator and delimiters for es-AR, fi, ro and sv
 - Fix 'errors.messages.too_(long|short)' for German (de)
 - Add transliteration rules for German (de)
 - Add missing keys to Chinese/Hong Kong (zh-HK)
 - Add English/Ireland (en-IE)
 - Add missing keys to Icelandic (is)
 - Add missing keys to Danish (da)
 - Fix a grammar error for Bulgarian (bg)
 - Order keys of French (fr) locale alphabetically
 - Singularize Millionen, Billionen for German/Switzerland (de-CH)
 - Fix date format for Italian (it)
 - Add transliteration rules for French (fr)
 - Add Spanish/Costa Rica (es-CR)
 - Remove trailing spaces for many languages
 - Fix abbr_month_names and month_names for Catalan (ca)
 - Reintroduce English/US (en-US)
 - Add transliteration rules for Romanian (ro)
 - Fix abbr_day_names and abbr_month_names for French (fr)
 - Fix 'storage_units.units.byte' key for Chinese/Taiwan (zh-TW)
 - Use 12-hour clock for :en-US and :en-CA
 - Fix 'date.formats.default' key in en-US locale
 - Fix some translations for Chinese/Hong Kong (zh-HK)
 - Fix translations for less_than_x_{minutes,seconds} for Japanese (ja)
 - Fix 'errors.messages.confirmation' key for Russian (ru)
 - Fix 'datetime.distance_in_words' keys for Hungarian (hu)
 - Fix the currency unit for Polish (pl)
 - Fix the currency unit for French/Switzerland (fr-CH)

## 0.7.4 (2013-07-04)
 - Add Odiya language (or)
 - Revert several translations for Spanish/Colombia (es-CO)
 - Add Swiss-German (iso-639-2/gsw-CH)
 - Add Chinese/Hong Kong (zh-HK)
 - Fix some translations for Mongolian (mn)
 - Fix some translations for Hebrew (he)
 - Fix date and time formats for English/Austraria (en-AU)
 - Add English/New Zealand (en-NZ)
 - Fix some translations for Finnish (fi)
 - Fix the case in x_seconds for Russian (ru)
 - Add :many pluralization value for Polish (pl)
 - Change the value of strip_insignificant_zeros to false for Norwegian (nb)

## 0.7.3 (2013-03-19)
 - Fix number delimiter and separator for Italian (it)
 - Fix currency delimiter and separator for Romanian (ro)
 - Fix time formats for Portuguese/Brazil (pt-BR)
 - Fix several translations for Estonian (et)
 - Fix several translations for Spanish/Colombia (es-CO)
 - Fix the translation of half_a_minute for Tagalog (tl)
 - Fix separators for Russian (ru)
 - Add Afrikaans locale (af)
 - Fix some spelling mistakes for Catalan (ca)
 - Use secure Rubygems URL
 - Change capitalization rules for Italian (it)
 - Fix abbreviations, currency format, etc. for Greek (el)
 - Fix the translation of submit for Portuguese (pt)

## 0.7.2 (2012-12-28)
 - Remove spurious `mis` from Welsh month names
 - Add OneOther default pluralization rule and create corresponding locale pluralization files
 - Add pluralization files for locales with region
 - Update Persian (fa) translation

## 0.7.1 (2012-11-24)
 - Update Peruvian Spanish (es-PE) translation
 - Fix pluralization rules for OneTwoOther
 - Fix pluralization rules for Hungarian (hu)
 - Update Japanese (ja) translation
 - Fix and complete translations of Macedonian (mk), Cyrillic Serbian (sr) and Serbo-Croatian (scr)

## 0.7.0 (2012-10-23)
 - Remove Swiss German (gsw-CH) as a duplicate of de-CH
 - Remove en-US
 - Remove region code from bn-IN, gl-ES, pt-PT and sv-SE
 - Move iso-639-2 locales into their own directory
 - Add pluralization rule for Upper Sorbian
 - Fix grammar mistakes on Bulgarian (bg) translation
 - Add Latin American Spanish (es-419) translation

## 0.6.6 (2012-09-07)
 - added Uzbek (uz) translation
 - added Swiss Italian (it-CH) translation
 - fixed Swiss German (de-CH) translation
 - added Polish (pl) transliteration
 - fixed Greek (el) translation
 - added Nepali (ne) translation
 - fixed Argentina Spanish (es-AR) translation

## 0.6.5 (2012-07-02)
 - fixed Icelandic translation
 - fixed Portuguese translation
 - completed Vietnamese translation and transliteration
 - added Canadian English
 - fixed Tagalog delimiter and separator
 - fixed Bosinian translation
 - fixed French translation
 - added Engish (en) translation
 - added Spanish (Venizuela) translation
 - complted Turkish translation

## 0.6.4 (2012-05-17)
- fixed Croatian translation and pluralization
- added Wolof translation
- fixed Hebrew pluralization
- added Tagalog translation
- fixed Bosinan pluralization
- fixed Lativian pluralization

## 0.6.3 (2012-04-15)

- fixed English (India) translations
- fixed Hebrew pluralization

## 0.6.2 (2012-03-28)

- added a patch for Ruby 1.8.7 support

## 0.6.1 (2012-03-25)

- uses I18n.available_locales to load selected locales
- added transliteration rule for Ukrainian
- completed translations for Mongolian (mn)

## 0.5.2 (2012-03-17)

- fixed Polish pluralization
- fixed Hungarian pluralization
- fixed Belarus pluralization
- completed Croatian translations

## 0.5.1 (2012-03-01)

- pluralization and transliteration work out of the box
- added pluralization rules for non-English-like locales
- added transliteration rule for Russian
- removed translations for will_paginate gem
- brought activemodel and activerecord namespaces back which was removed in 21c8006

## 0.4.0 (2012-02-10)

- removed `activerecord` namespace
- removed `support.select namespace` and updated `helpers.select` when present
- removed the `fun` directory
- added a pluralization rule for French (fr) locale
- replaced pluralization instances of `1` with `%{count}` in French (fr) locale
- modified `datetime.distance_in_words.almost_x_years` for Russion (ru) locale
- changed `number.currency.format.precision` from 3 to 0 for Japanese (ja) locale

## 0.3.0 (2012-01-10)

- loads will_paginate/*.yml if the constant WillPaginate is defined
- filled in missing will_paginate translations for en-US/en-GB/ja/sk
- Friulian(fur) is ready for Rails 2 and 3
- corrected translation for 'too_short' (ro)
- added will_paginate translation (ro)

## 0.2.1 (2011-12-27)

- filled in missing formatting/punctuation translations with their en-US versions
- added en-IN locale
- changed `time.formats.long` for Japanese (ja)

## 0.2.0 (2011-12-04)

- moved :'activerecord.errors.messages.taken' to :'errors.messages.taken'
- moved :'activerecord.errors.messages.record_invalid'  to :'errors.messages.record_invalid'
- moved Bulgarian (bg) transliterations into a new 'transliterations' folder
- aliased :'activerecord.errors.template' to :'errors.template'
- aliased :'activerecord.errors.messages' to :'errors.messages'
- updated interpolation syntax for Basque (eu)
- updated interpolation syntax for Peruvian Spanish (es-PE)
- deleted translations that are absent from en-US (with the exception of translations for pluralization)
- converted the Czech (cs) localization file to yml
- converted the Thai (th) localization file to yml
- removed the hard coded Buddhist era from the Thai (th) localization file
- fixed obvious indentation/scoping errors
