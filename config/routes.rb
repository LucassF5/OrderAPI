Rails.application.routes.draw do

  get "/me", to: "users#me"
  post "/auth/login", to: "auth#login"

  resources :users, only: [:create, :update, :destroy]
  resources :products
  resources :categories
  resources :stores
end
