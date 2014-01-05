#require 'active_record'
require 'action_controller/railtie'
require 'action_view/railtie'

I18n.enforce_available_locales = false

app = Class.new(Rails::Application)
app.config.secret_token = "4d616dad7a1c4460246f0a8c946a17ab"
app.config.session_store :cookie_store, :key => "_myapp_session"
app.config.active_support.deprecation = :log
app.config.i18n.default_locale = "en-US"
app.config.eager_load = false
app.initialize!
