# config/routes.rb

Drone::Application.routes.draw do
  root :to => redirect('/roles')

  resources :recruiters, :roles
end # routes
