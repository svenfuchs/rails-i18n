Rails Locale Data Repository
============================

[![Build Status](https://secure.travis-ci.org/svenfuchs/rails-i18n.png)](http://travis-ci.org/svenfuchs/rails-i18n)

Central point to collect locale data for use in Ruby on Rails.

## Gem installation

Add to your Gemfile:

    gem 'rails-i18n', '~> 4.0.0' # For 4.0.x
    gem 'rails-i18n', '~> 3.0.0' # For 3.x
    gem 'rails-i18n', github: 'svenfuchs/rails-i18n', branch: 'master' # For 4.x
    gem 'rails-i18n', github: 'svenfuchs/rails-i18n', branch: 'rails-3-x' # For 3.x

or run this command:

    gem install rails-i18n -v '~> 4.0.0' # For 4.0.x
    gem install rails-i18n -v '~> 3.0.0' # For 3.x

Note that your rails version must be 3.0 or higher if you want to install `rails-i18n` as a gem. For rails 2.x, install it manually as described below.

## Configuration

By default `rails-i18n` loads all locale files, pluralization and
transliteration rules available in the gem. This behaviour can be changed, if you
specify in `config/environments/*` the locales which have to be loaded via
`I18n.available_locales` option:

    config.i18n.available_locales = ['es-CO', :de]

or

    config.i18n.available_locales = :nl

## Manual installation

Download the locale files that are found in the directory [rails/locale](http://github.com/svenfuchs/rails-i18n/tree/master/rails/locale/) and put them into the `config/locales` directory of your Rails application.

If any translation doesn't suit well to the requirements of your application, edit them or add your own locale files.

For more information, visit [Rails Internationalization (I18n) API](http://guides.rubyonrails.org/i18n.html) on the _RailsGuides._

## Usage on Rails 2.3

Locale data whose structure is compatible with Rails 2.3 are available on the separate branch [rails-2-3](https://github.com/svenfuchs/rails-i18n/tree/rails-2-3).

## Available Locales

Available locales are:

> af, ar, az, bg, bn, bs, ca, cs, cy, da, de, de-AT, de-CH, el, en, en-AU, en-CA, en-GB, en-IE, en-IN, en-NZ, en-US, eo,
> es, es-419, es-AR, es-CL, es-CO, es-CR, es-MX, es-PA, es-PE, es-VE, et, eu, fa, fi, fr, fr-CA, fr-CH, gl,
> he, hi, hi-IN, hr, hu, id, is, it, it-CH, ja, kn, ko, lo, lt, lv, mk, mn, ms, nb,
> ne, nl, nn, or, pl, pt, pt-BR, rm, ro, ru, sk, sl, sr, sv, sw, th,
> tl, tr, uk, ur, uz, vi, wo, zh-CN, zh-HK, zh-TW, zh-YUE

Following locales are complete:

> bs, da, en, en-US, es-EC, es-PA, fr, hr, is, ja, lt, nl, sr, ur, zh-HK, zh-YUE

Following locales have some missing translations or pluralizations:

> af, ar, az, bg, bn, ca, cs, cy, de, de-AT, de-CH, el, en-AU, en-CA, en-GB, en-IE, en-IN, en-NZ, eo,
> es, es-419, es-AR, es-CL, es-CO, es-CR, es-MX, es-PE, es-VE, et, eu, fa, fi, fr-CA, fr-CH,
> gl, he, hi, hi-IN, hu, id, it, it-CH, kn, ko, lo, lv, mk, mn, ms, nb,
> ne, nn, or, pl, pt, pt-BR, rm, ro, ru, sk, sl, sv, sw, th,
> tl, tr, uk, uz, vi, wo, zh-CN, zh-TW

We always welcome your contributions!

## How to contribute

### Quick contribution

If you are familiar with GitHub operations, follow the procedures described in the subsequent sections.

If you are not,

* Save your locale data on the [Gist](http://gist.github.com).
* Open an issue with reference to the Gist you created.

### Fetch the `rails-i18n` repository

* Get a github account and Git program if you haven't. See [Help.Github](http://help.github.com/) for instructions.
* Fork `svenfuchs/rails-i18n` repository and clone it into your PC.

### Create or edit your locale file

* Have a look in `rails/locale/en.yml`, which should be used as the base of your translation.
  Note that we use `&errors_messages` and `<<: *errors_messages` to anchor and merge a part of translation data.
* Create or edit your locale file.
  Please pay attention to save your files as UTF-8.

### Test your locale file

Before committing and pushing your changes, test the integrity of your locale file.

    rake spec

Make sure you have included all translations with:

    rake i18n-spec:completeness rails/locale/en.yml rails/locale/YOUR_NEW_LOCALE.yml

You can list all complete and incomplete locales:

    thor locales:complete
    thor locales:incomplete

Also, you can list all available locales:

    thor locales:list

You can list all missing keys:

    i18n-tasks missing es

### Edit README.md

Add your locale name to the list in `README.md` if it isn't there.

### Send pull request

If you are ready, push the repository into the Github and send us a pull request.

We will do the formality check and publish it as quick as we can.

## See also

* [devise-i18n](https://github.com/tigrish/devise-i18n)
* [will-paginate-i18n](https://github.com/tigrish/will-paginate-i18n)
* [i18n-country-translation](https://github.com/onomojo/i18n-country-translations) for translations of country names
* [i18n-spec](https://github.com/tigrish/i18n-spec) for RSpec matchers to test your locale files
* [iso](https://github.com/tigrish/iso) for the list of valid language/region codes and their translations

## License

[MIT](https://github.com/svenfuchs/rails-i18n/blob/master/MIT-LICENSE.txt)

## Contributors

See [https://github.com/svenfuchs/rails-i18n/contributors](https://github.com/svenfuchs/rails-i18n/contributors)

## Special thanks

[Tsutomu Kuroda](https://github.com/kuroda) for untiringly taking care of this repository, issues and pull requests
