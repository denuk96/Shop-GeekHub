Rails.application.routes.draw do
  root 'products#index', as: 'home'
  resources :products
end
