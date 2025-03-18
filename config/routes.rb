Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resource :user, only: [:show, :edit, :update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "dashboard", to: "pages#dashboard"

  # Routen for User Skills
  resources :user_skills do
    # Routes for Requests
    resources :requests, only: [:create]
  end

  # Independent request route for displaying a request (request detail page)
  resources :requests, only: [:index, :show] do
    # Route for Messages / CHAT
    resources :reviews, only: [:new, :create]
    resources :messages, only: [:create]
  end

  patch "completed/:id", to: "requests#completed", as: :completed
  # Defines the root path route ("/")
  # root "posts#index"
  resources :user_skills, only: [:index, :show]
  resources :users, only: [:show]
end
