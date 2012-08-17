Jetset::Application.routes.draw do
  devise_for :users


  root :to => 'home#index'
  match "/account" => "accounts#index"

  resources :auths
  match "auth/confirm" => "auths#confirm"
  match "auth/confirm_pin" => "auths#confirm_pin"
end
