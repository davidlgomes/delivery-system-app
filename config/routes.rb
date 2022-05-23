Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to:'home#index'
  resources :carrier_managements, only:[:show, :create, :new, :edit, :update, :destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
