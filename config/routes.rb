SauceApi::Application.routes.draw do
  resources :sauces, :only => [:index], :path => ''
end
