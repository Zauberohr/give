Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Healthcheck route
  get "up" => "rails/health#show", as: :rails_health_check

  # Routen for User Skills
  resources :user_skills do
    # Routes for Requests
    resources :requests, only: [:create]
  end

  # Independent request route for displaying a request (request detail page)
  resources :requests, only: [:show] do
    # Route for Messages / CHAT
    resources :messages, only: [:create]
  end
  # Defines the root path route ("/")
  # root "posts#index"
  resources :user_skills, only: [:index, :show]
  resources :users, only: [:show]
end
