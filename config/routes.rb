SauceApi::Application.routes.draw do
  devise_for :admins
  devise_for :users

  resources :sauces
  resources :flavors
  resources :manufacturers

  root :to => "sauces#index"
end
