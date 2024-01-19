Rails.application.routes.draw do
  # root "posts#index"

  namespace :api do
    get 'users', to: 'users#users'
    get 'rooms', to: 'rooms#show'
    
    get 'users/:id', to: 'users#users'
    get 'rooms/:id', to: 'rooms#show'

    resources :users, only: [:index, :create, :update, :destroy]
    resources :rooms, only: [:index, :create, :update, :destroy]
    resources :reservations, only: [:index, :create, :update, :destroy]
  end
end
