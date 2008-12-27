curr_dir = File.expand_path(File.dirname(__FILE__))
rails_locale_dir = File.expand_path(File.join(curr_dir, "..", "rails"))

puts "Fetching latest Rails locale files to #{rails_locale_dir}"

exec %(
  curl http://github.com/rails/rails/tree/master/actionpack/lib/action_view/locale/en.yml?raw=true > #{rails_locale_dir}/action_view.yml

  curl http://github.com/rails/rails/tree/master/activerecord/lib/active_record/locale/en.yml?raw=true > #{rails_locale_dir}/active_record.yml

  curl http://github.com/rails/rails/tree/master/activesupport/lib/active_support/locale/en.yml?raw=true > #{rails_locale_dir}/active_support.yml
)
