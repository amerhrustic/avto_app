Rails.application.routes.draw do
  # Domača stran
  root "cars#index"

  # Cars Routes
  resources :cars, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    collection do
      get :load_models  # Dynamically load models based on the selected brand
    end
  end

  # Brand Routes
  resources :brands, only: [:index]

  # Model Routes
  resources :models, only: [:index]
  get "/models_by_brand", to: "models#models_by_brand" # API endpoint for dynamically loading models

  # Routes for Sessions (Login and Logout)
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # Routes for Users (Registration)
  get "/register", to: "users#new"  # Registration form
  post "/users", to: "users#create"  # Handles the POST request for user registration

  # Ostale poti (upravljanje z uporabniki)
  resources :users, only: [:index, :show, :edit, :update, :destroy] # Optional, only needed for user management

end
