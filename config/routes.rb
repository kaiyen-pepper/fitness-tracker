Rails.application.routes.draw do
  get 'calendar', to: 'calendar#index', as: 'calendar'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root to: "home#index"

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

  # This creates standard RESTful routes plus two custom ones:
  # GET /products/:id/variants to show product variants
  # POST /products/:id/duplicate to copy a product
  resources :products do
    member do
      get "variants"
      post "duplicate"
    end
  end

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
