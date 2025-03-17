Rails.application.routes.draw do
  get "users/new"
  get "users/create"
  get "users/login"
  get "models/index"
  get "brands/index"
  get "cars/index"
  get "cars/show"
  get "pages/home"
 get '/models', to: 'models#index'
  root "cars#index"

  resources :cars, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :brands, only: [:index]
  resources :models, only: [:index]
end
