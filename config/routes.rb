Kapow::Application.routes.draw do
  get "releases/new"

  get "releases/upcoming"

  get "home/index"

  root :to => 'home#index'
end
