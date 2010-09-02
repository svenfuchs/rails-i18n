curr_dir = File.expand_path(File.dirname(__FILE__))
rails_locale_dir = File.expand_path(File.join(curr_dir, "..", "rails"))

puts "Fetching latest Rails locale files to #{rails_locale_dir}"

exec %(
  curl -Lo '#{rails_locale_dir}/action_view.yml' http://github.com/rails/rails/raw/master/actionpack/lib/action_view/locale/en.yml

  curl -Lo '#{rails_locale_dir}/active_model.yml' http://github.com/rails/rails/raw/master/activemodel/lib/active_model/locale/en.yml

  curl -Lo '#{rails_locale_dir}/active_record.yml' http://github.com/rails/rails/raw/master/activerecord/lib/active_record/locale/en.yml

  curl -Lo '#{rails_locale_dir}/active_support.yml' http://github.com/rails/rails/raw/master/activesupport/lib/active_support/locale/en.yml
)