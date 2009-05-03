plugin 'rails-i18n', :git => 'git://github.com/svenfuchs/rails-i18n.git'

inside('public/javascripts') do
  dir = "#{root}/vendor/plugins/rails-i18n/tools/rails-i18n-examples/public/javascripts"
  %w(jquery.js rails_i18n_examples.js).each do |file|
    run "ln -s #{dir}/#{file} #{file}"
  end
end