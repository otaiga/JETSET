Jetset::Application.routes.draw do
  devise_for :users


  root :to => 'home#index'
  match "/account" => "accounts#index"
  get "/account/roaming" => "accounts#roaming"

  resources :auths
  match "auth/confirm" => "auths#confirm"
  match "auth/confirm_pin" => "auths#confirm_pin"

  post "/notification" => "notifications#retieve_notification"
end
