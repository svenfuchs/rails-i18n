#require 'active_record'
require 'action_controller/railtie'
require 'action_view/railtie'

app = Class.new(Rails::Application)
app.config.secret_token = "4d616dad7a1c4460246f0a8c946a17ab"
app.config.session_store :cookie_store, :key => "_myapp_session"
app.config.active_support.deprecation = :log
app.initialize!
