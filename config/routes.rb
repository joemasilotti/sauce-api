SauceApi::Application.routes.draw do
  resources :sauces, :only => [:index, :show]
  root :to => "sauces#index"
end
