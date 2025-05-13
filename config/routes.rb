Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  get 'calendar', to: 'calendar#index', as: 'calendar'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Changing root to home/ login page first
  # root to: "home#index"

  # This means when someone goes to /users, the app shows the index action in the UsersController
  get "/users", to: "users#index"
  # RESTful routes. These are standard ways to handle creating, reading, updating, and deleting (CRUD) things in your app
  resources :users

  resources :workouts

  # to make a user profile page
  get "/profile", to: "users#profile"

  # This lets you reach articles at /admin/articles, keeping things tidy
  namespace :admin do
    resources :articles, :comments
  end

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "home#home"
  get "dashboard", to: "home#dashboard"

  # delete session
  resource :session, only: [:new, :create, :destroy]
end
