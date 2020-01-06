Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root 'products#index', as: 'home'

    resources :products do
      resources :images, controller: 'backoffice/images'
      resources :comments
    end

    scope :admin do
      resources :categories, controller: 'backoffice/categories', as: 'admin_categories'
      resources :products, controller: 'backoffice/products', as: 'admin_products'
    end

    resources :users, :sessions

    get 'signup', to: 'users#new', as: 'signup'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
  end
end
