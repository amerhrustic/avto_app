Rails.application.routes.draw do
  root "cars#index"

  # Cars Routes
  resources :cars, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    collection do
      get :load_models  # Dinamično nalaganje modelov glede na izbrano znamko
    end
  end

  # Brand Routes
  resources :brands, only: [:index]

  # Model Routes
  resources :models, only: [:index]
  get "/models_by_brand", to: "models#models_by_brand" # API endpoint za dinamično nalaganje modelov

  # User Authentication Routes
  get "/register", to: "users#new"
  post "/register", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # Users Routes
  resources :users, only: [:index, :show, :edit, :update, :destroy]
end
