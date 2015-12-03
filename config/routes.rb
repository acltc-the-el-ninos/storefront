Rails.application.routes.draw do
  devise_for :users
  # root to: "products#index"
  get "/" => 'products#index'
  get "/products" => 'products#index'
  get "/products/new" => 'products#new'
  post "/products" => 'products#create'
  get "/products/:id/edit" => 'products#edit'
  delete "/products/:id" => 'products#destroy'
  patch "/products/:id" => 'products#update'
  get "/products/:id" => 'products#show'
  post "/search" => 'products#search'

  post "/orders" => 'orders#create'
  get "/orders/:id" => 'orders#show'

  get "/carted_products" => 'carted_products#index'
  post "/carted_products" => 'carted_products#create'
  delete "/carted_products/:id" => 'carted_products#destroy'
end
