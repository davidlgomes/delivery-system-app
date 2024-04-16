Rails.application.routes.draw do
  get 'home/index'
  devise_for :users


  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :carrier_managements, only:[:show, :create, :new, :edit, :update, :destroy]
  resources :vehicle_deliveries, only:[:index, :show, :create, :new, :edit, :update, :destroy]
  resources :delivery_prices, only:[:index, :show, :create, :new, :edit, :update, :destroy]
  resources :price_queries, only:[:index, :show, :create, :new, :edit, :update, :destroy]
  resources :deadlines, only:[:index, :show, :create, :new, :edit, :update, :destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
