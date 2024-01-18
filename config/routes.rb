Rails.application.routes.draw do
  # root "posts#index"

  namespace :api do
    get 'users', to: 'users#users'
    get 'rooms', to: 'rooms#rooms'
    
    resources :users, only: [:index, :create, :update, :destroy]
    resources :rooms, only: [:index, :create, :update, :destroy]
    resources :reservations, only: [:index, :create, :update, :destroy]
  end
end
