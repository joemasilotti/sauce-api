SauceApi::Application.routes.draw do
  devise_for :admins

  resources :sauces
  root :to => "sauces#index"
  resources :flavors
  resources :manufacturers
end
