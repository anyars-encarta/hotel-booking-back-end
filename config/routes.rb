Rails.application.routes.draw do
  # root "posts#index"

  namespace :api do
    get 'users/:id', to: 'users#show'
    get 'categories/:id', to: 'categories#show'

    resources :users, only: [:index, :create, :update, :destroy]
    resources :categories, only: [:index, :create, :update, :destroy]
    resources :rooms, only: [:index, :create, :update, :destroy, :show]
    resources :reservations, only: [:index, :create, :update, :destroy]
  end
end
