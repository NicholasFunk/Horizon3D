Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "categories/index"
  get "categories/show"
  
  resources :products

  # Change this to a proper home page.
  root "products#index"
  
  
end
