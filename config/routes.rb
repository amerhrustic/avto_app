Rails.application.routes.draw do
  root "cars#index"

  resources :cars, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :brands, only: [:index]
  resources :models, only: [:index]

  resources :users, only: [:new, :create]
  get "login", to: "users#login"

  get "/models_by_brand", to: "models#models_by_brand"
end

