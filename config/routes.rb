SauceApi::Application.routes.draw do
  resources :sauces
  root :to => "sauces#index"
  resources :flavors
  resources :manufacturers
end
