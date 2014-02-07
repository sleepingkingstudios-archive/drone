# config/routes.rb

Drone::Application.routes.draw do
  root :to => redirect('/roles')

  resources :roles
end # routes
