Rails.application.routes.draw do
  #get 'sessions/new'
  root 'products#index', as: 'home'
  resources :products

  scope :admin do
    resources :categories, controller: 'backoffice/categories', as: 'backofficeCategories'
    resources :products, controller: 'backoffice/products'
  end

  resources :users
  resources :sessions

  get 'signup', to: 'user#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
