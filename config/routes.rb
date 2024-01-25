Rails.application.routes.draw do
  get 'current_user', to: 'current_user#index'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # root "posts#index"

  namespace :api do
    get 'users', to: 'users#users'
    # get 'rooms', to: 'rooms#rooms'
    get 'users/:id', to: 'users#show'
    get 'categories/:id', to: 'categories#show'
    resources :users, only: [:index, :create, :update, :destroy]
    resources :rooms, only: [:index, :create, :update, :destroy, :show]
    resources :reservations, only: [:index, :create, :update, :destroy]
    resources :categories, only: [:index, :create, :update, :destroy] do
      get 'rooms', on: :member
    end
  end

end
