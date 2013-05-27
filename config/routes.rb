SauceApi::Application.routes.draw do
  resources :sauces, :only => [:index, :show, :edit, :update]
  root :to => "sauces#index"
end
