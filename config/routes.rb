Rails.application.routes.draw do
  resources :users
  get "contact/index", to: "contact#index"
  get "about/index", to: "about#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "categories/index"
  get "categories/show"

  resources :users
  get '/signup', to: 'users#new', as: 'signup'

  get '/login', to: 'sessions#login', as: '/login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  resources :cart, only: %i[ create destroy ]
  
  resources :products do
    collection do
      get "search", to: "products#search"
    end
  end

  # Change this to a proper home page.
  root to: "products#index"
end
