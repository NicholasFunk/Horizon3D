Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "categories/index"
  get "categories/show"
  
  resources :products

  root "products#index"
  
  
end
