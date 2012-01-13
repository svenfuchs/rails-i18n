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
