Rails.application.routes.draw do
  root 'products#index', as: 'home'

  get '/static_pages/:page' => 'static_pages#show', as: 'static_page'

  resources :products do
    resources :images, controller: 'backoffice/images'
    resources :comments
  end

  scope :purchase do
    resources :carts, controller: 'carts', as: 'purchase_cart'
    resources :cart_items, controller: 'cart_items', as: 'purchase_cart_items'
    resources :orders, controller: 'orders', as: 'purchase_orders'
    get 'buy', to: 'cart_items#create', as: 'purchase_buy'
    get 'increase_cart_item', to: 'cart_items#increase_cart_item', as: 'purchase_increase_cart_item'
    get 'decrease_cart_item', to: 'cart_items#decrease_cart_item', as: 'purchase_decrease_cart_item'
  end

  resources :users, :sessions

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  scope :admin do
    resources :categories, controller: 'backoffice/categories', as: 'admin_categories'
    resources :products, controller: 'backoffice/products', as: 'admin_products'
    resources :orders, controller: 'backoffice/orders', as: 'admin_orders' do
      collection do
        get 'send_order_confirmation'
      end
    end
    resources :cart_items, controller: 'backoffice/cart_items', as: 'admin_cart_items' do
      get 'increase_cart_item'
      get 'decrease_cart_item'
    end
  end
end
