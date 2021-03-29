Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "home#index", as: :home

  resources :users
  resources :menu_items
  resources :menu_categories
  resources :cart_items
  resources :order_items
  resources :orders

  get "/cart" => "cart#index", as: :cart
  post "/cart" => "cart#create", as: :cart_new

  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signin" => "sessions#destroy", as: :destroy_session

end
