Rails Locale Data Repository
============================

Central point to collect locale data for use in Ruby on Rails.

Rails translations
------------------

### How to use them

Download the locale files that are found in the directory [rails/locale](http://github.com/svenfuchs/rails-i18n/tree/master/rails/locale/) and put them into the `config/locales` directory of your Rails application.

If any translation doesn't suit well to the requirements of your application, edit them.

Available locales are:
> ar, bg, bn-IN, bs, ca, cz, da, de, de-AT, de-CH, dsb, el, en-GB, en-US, eo, es,
> es-AR, es-CO, es-MX, es-PE, et, eu, fa, fi, fr, fr-CA, fr-CH, fur, gl-ES,
> gsw-CH, he, hi-IN, hr, hsb, hu, id, is, it, ja, ko, lo, lt, lv, mk, mn, nb,
> nl, nn, pl, pt-BR, pt-PT, rm, ro, ru, sk, sl, sr, sr-Latn, sv-SE, sw, th,
> tr, uk, vi, zh-CN, zh-TW

Note that all locale files are not yet ready for Rails 3. Currently, following locales are ready for Rails 2 and 3:
> en-US, eo, es-AR, es-MX, et, fr, fr-CA, fr-CH, gsw-CH, hi-IN, ja, sk, sw, th, zh-CN, zh-TW

We always welcome your contributions!

### How to contribute

#### Quick contribution

If you are familiar with GitHub operations, follow the procedures described in the subsequent sections.

If you are not,

* Save your locale data on the [Gist](http://gist.github.com).
* Open an issue with reference to the the Gist you created.

#### Fetch the `rails-18n` repository

* Get a github account and Git program if you haven't. See [Help.Github](http://help.github.com/) for instructions.
* Fork `svenfuchs/rails-i18n` repository and clone it into your PC.

#### Create or edit your locale file

* Have a look in `rails/locale/en-US.yml`, which can be used as the base of your translation.
  This file is a compound of all translation files in the Rails 2 and 3 packages.
  Note that we use `&errors_messages` and `<<: *errors_messages` to anchor and merge a part of translation data.
* Create or edit your locale file.
  Please include a comment with the language/locale name and your name and email address (or other contact information like your github profile) to the locale file so people can come contact you and ask questions etc.
  Also, please pay attention to save your files as UTF-8.

#### Test your locale file

Before commit and push your changes, test the integrity of your locale file.

Make sure you have the <code>i18n</code> and <code>thor</code> installed. If you haven't, install them:

    sudo gem install i18n thor

You can test your locale by running following command on the root directory of this repository:

    thor locales:test [your-locale]

Assuming that there is a file <code>rails/locale/[your-locale].{rb,yml}</code> you will get a list of keys missing from your locale data.

Invoke following command to test all locale files:

    thor locales:test_all

You can list all locales that are ready both for Rails version 2 and 3:

    thor locales:ready

You can also list the locales ready for a specific version of Rails. For example:

    thor locales:ready_for 3

Lastly, you can list all available locales:

    thor locales:list

#### Edit README.md

Add your locale name to the list in `README.md` if it isn't there.

#### Send pull request

I you are ready, push the repository into the Github and send us a pull request.

We will do the formality check and publish it as quick as we can.

Rails I18n Textmate bundle
--------------------------

### The bundle adds the following commands:

#### Extract Translation (cmd-shift-e):
* prompts you for a dot-separated key
* adds the translation (mapping the dot-separated key to nested yaml keys)
* replaces the selected string in your source-code with the dot-separated key wrapped into a call to t(your.key), if interpolations are detected within translation, the replacement text will prompt for them.

#### Look up Translation (cmd-shift-i):
* Looks up the currently selected key if text is selected
* If nothing is selected, it will look up all the keys in the currently selected file.

### The bundle adds the following tab triggers:

#### tr:
* Inserts I18n.translate("") or translate("") based on your context

#### The following properties are editable:
* default locale
* translation file path
* whether extract inserts the long syntax (I18n.translate) or short syntax (I18n.t)
* where and if translation changes are logged

Note that Textmate, while active, won't reload the translations.yml for you if it's already open. When you give the focus to another application and then go back to Textmate (e.g. with cmd-tab, cmd-tab) it will reload the file. I found it useful to have translations.yml open on a second monitor while extracting translations from my application.

I still have to figure out how to automatically select the next string after this command has run. It works well to just use Textmate's "Find Next" though:

1. hit cmd-f and give it <code>("|').*(\1)</code> as a search expression, tell it to use this as a "Regular expression"
1. hit return and it will select the next string
1. use shift-cmd-e to extract that string
1. hit cmd-g to select the next string
