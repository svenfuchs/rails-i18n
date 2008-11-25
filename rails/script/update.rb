require 'tmpdir'

curr_dir = Dir.pwd
tmp_dir = Dir.tmpdir
FileUtils.rm_rf "#{tmp_dir}/rails-i18n" if File.exists? "#{tmp_dir}/rails-i18n"

exec %(
  cd #{tmp_dir};
  mkdir rails-i18n;
  cd rails-i18n;
  echo 'created tmp dir';
  echo 'cloning rails';
  git clone git://github.com/rails/rails.git;
  cp ./rails/actionpack/lib/action_view/locale/en.yml #{curr_dir}/rails/rails/action_view.yml;
  cp ./rails/activerecord/lib/active_record/locale/en.yml #{curr_dir}/rails/rails/active_record.yml;
  cp ./rails/activesupport/lib/active_support/locale/en.yml #{curr_dir}/rails/rails/active_support.yml;
  cd ..;
  rm -rf rails-i18n;
)

