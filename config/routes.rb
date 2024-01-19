Rails.application.routes.draw do
  # root "posts#index"

  namespace :api do
    get 'users/:id', to: 'users#index'

    resources :users, only: [:index, :create, :update, :destroy]
    resources :rooms, only: [:index, :show, :create, :update, :destroy]
    resources :reservations, only: [:index, :create, :update, :destroy]
  end
end
