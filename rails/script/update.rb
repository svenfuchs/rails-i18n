curr_dir = File.expand_path(File.dirname(__FILE__))
rails_locale_dir = File.expand_path(File.join(curr_dir, "..", "rails"))

puts "Fetching latest Rails locale files to #{rails_locale_dir}"

exec %(
  curl -Lo '#{rails_locale_dir}/action_view.yml' https://raw.github.com/rails/rails/master/actionview/lib/action_view/locale/en.yml

  curl -Lo '#{rails_locale_dir}/active_record.yml' https://raw.github.com/rails/rails/master/activerecord/lib/active_record/locale/en.yml

  curl -Lo '#{rails_locale_dir}/active_support.yml' https://raw.github.com/rails/rails/master/activesupport/lib/active_support/locale/en.yml
)
