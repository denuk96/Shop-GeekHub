Rails.application.routes.draw do
  root 'products#index', as: 'home'
  resources :products

  scope :admin do
    resources :categories, controller: 'backoffice/categories', as: 'admin_categories'
    resources :products, controller: 'backoffice/products', as: 'admin_products' do
      resources :images, controller: 'backoffice/images'
    end
  end

  resources :users
  resources :sessions

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
