SauceApi::Application.routes.draw do
  resources :sauces
  root :to => "sauces#index"
  resources :flavors
end
