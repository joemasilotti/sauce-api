SauceApi::Application.routes.draw do
  devise_for :admins
  devise_for :users

  resources :sauces do
    resources :reviews, only: [:index, :show, :new, :create]
  end

  resources :flavors, :manufacturers

  root :to => "sauces#index"
end
