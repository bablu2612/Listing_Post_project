Rails.application.routes.draw do
  resources :buyer_listings

  resources :sellers
  get "/admin", to: "admin#index"
  post "/publish_list",to: "buyer_listings#publish_listing"

  post "/offer_action",to: "sellers#offer_action"
  
  devise_for :users

  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
