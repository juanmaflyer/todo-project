ActionController::Routing::Routes.draw do |map|
  


  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  map.resources :lista_de_tareas, :has_many => :tareas
  map.resources :users, :has_many => :lista_de_tareas
  map.resources :user_sessions
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
  map.root :controller => "home"
end
