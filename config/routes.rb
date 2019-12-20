Rails.application.routes.draw do
  root 'products#index', as: 'home'
  resources :products

  scope :admin do
    #get 'backoffice/categories/index', as: 'admin'
    resources :categories, controller: 'backoffice/categories', as: 'backofficeCategories'
    resources :products, controller: 'backoffice/products'
  end
end
