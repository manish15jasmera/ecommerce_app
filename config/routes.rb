Rails.application.routes.draw do
  get 'profiles/edit'
  get 'profiles/update'
  get 'cart_items/create'
  get 'cart_items/update'
  get 'cart_items/destroy'
  get 'carts/show'
  get 'admin/dashboard'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "home#index"
  resources :products, only: [:index, :show]

  # get 'admin_dashboard', to: 'admin#dashboard', as: :admin_dashboard

  namespace :admin do
    resources :categories
    resources :products
    root to: "dashboard#index"
  end

  resource :cart, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy]

  resource :profile, only: [:show, :edit, :update]

  get 'checkout', to: 'orders#checkout'
end
