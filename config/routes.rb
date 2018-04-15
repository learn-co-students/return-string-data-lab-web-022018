Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  resources :products
  # get 'profile', to: 'users#show'
  # get 'inventory', to: 'products#inventory'
  # get 'description', to: 'products#description'
  get '/products/:id/description', to: 'products#description'
  get '/products/:id/inventory', to: 'products#inventory'
end
