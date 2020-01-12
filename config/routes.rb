Rails.application.routes.draw do
  root 'products#index', as: 'home'

  resources :products do
    resources :images, controller: 'backoffice/images'
    resources :comments
    get 'buy', to: 'cart_items#create', as: 'buy'
  end

  resources :users, :sessions, :cart_items, :carts

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  scope :admin do
    resources :categories, controller: 'backoffice/categories', as: 'admin_categories'
    resources :products, controller: 'backoffice/products', as: 'admin_products'
  end
end
