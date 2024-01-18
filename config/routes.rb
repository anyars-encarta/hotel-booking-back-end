Rails.application.routes.draw do
  # root "posts#index"

  namespace :api do
    get 'users', to: 'users#users'
    get 'rooms', to: 'rooms#rooms'
    
    resources :reservations

    # resources :reservations, except: [:index] # to use reservations without the index action
  end
end
