curr_dir = File.expand_path(File.dirname(__FILE__))
rails_locale_dir = File.expand_path(File.join(curr_dir, "..", "rails"))

puts "Fetching latest Rails locale files to #{rails_locale_dir}"

exec %(
  curl -Lo '#{rails_locale_dir}/action_view.yml' https://raw.githubusercontent.com/rails/rails/7-0-stable/actionview/lib/action_view/locale/en.yml

  curl -Lo '#{rails_locale_dir}/active_model.yml' https://raw.githubusercontent.com/rails/rails/7-0-stable/activemodel/lib/active_model/locale/en.yml

  curl -Lo '#{rails_locale_dir}/active_record.yml' https://raw.githubusercontent.com/rails/rails/7-0-stable/activerecord/lib/active_record/locale/en.yml

  curl -Lo '#{rails_locale_dir}/active_support.yml' https://raw.githubusercontent.com/rails/rails/7-0-stable/activesupport/lib/active_support/locale/en.yml
)
