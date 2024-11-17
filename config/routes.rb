Rails.application.routes.draw do
  get "about/index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "categories/index"
  get "categories/show"
  
  resources :products do
    collection do
      get 'search', to: 'products#search'
    end
  end

  # Change this to a proper home page.
  root "products#index"
  
  
end
