##

- added configuration which allow to load selected locales
- added transliteration rule for Ukrainian

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
