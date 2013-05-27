SauceApi::Application.routes.draw do
  resources :sauces, :only => [:index, :show, :edit, :update, :new, :create]
  root :to => "sauces#index"
end
