Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  root to: redirect('/api-docs')

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
    get 'users', to: 'users#index'
    get 'users/:id', to: 'users#show'
    get 'categories/:id', to: 'categories#show'
    resources :users, only: [:index, :create, :update, :destroy]
    resources :rooms, only: [:index, :create, :update, :destroy, :show]
    resources :reservations, only: [:index, :create, :update, :destroy]
    resources :categories, only: [:index, :create, :update, :destroy, :show] do
      get 'rooms', on: :member
    end
  end

end
