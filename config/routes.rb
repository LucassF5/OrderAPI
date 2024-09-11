Rails.application.routes.draw do

  post "/users", to: "users#create"
  get "/me", to: "users#me"
  post "/auth/login", to: "auth#login"

  resources :products
  resources :categories
end
