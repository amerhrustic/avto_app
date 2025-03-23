Rails.application.routes.draw do
  root "cars#index"

  # Cars Routes
  resources :cars, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    # Dodaš pot za dinamično nalaganje modelov za izbrano znamko
    collection do
      get :load_models
    end
  end

  # Brand Routes
  resources :brands, only: [:index]

  # Model Routes
  resources :models, only: [:index]

  # User Routes
  resources :users, only: [:new, :create]
  get "login", to: "users#login"

  # Model by Brand route (če boš potreboval, sicer lahko odstraniš)
  get "/models_by_brand", to: "models#models_by_brand"
end
