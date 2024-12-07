Rails.application.routes.draw do
  get "contact/index", to: "contact#index"
  get "about/index", to: "about#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "categories/index"
  get "categories/show"

  resources :cart, only: %i[ create destroy ]
  
  resources :products do
    collection do
      get "search", to: "products#search"
    end
  end

  # Change this to a proper home page.
  root to: "products#index"
end
