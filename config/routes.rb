SauceApi::Application.routes.draw do
  resources :sauces
  root :to => "sauces#index"
end
