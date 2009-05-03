ActionController::Routing::Routes.draw do |map|
  map.root :controller => "rails_i18n/examples"
  map.changes 'changes', :controller => "changes", :action => 'index'
  map.refresh 'update',  :controller => "changes", :action => 'update', :requirements => { :method => 'post' }
end
