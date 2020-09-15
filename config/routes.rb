Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :jobs do
    post '/bookings', to: 'bookings#create', as: 'quick_create'
    resources :bookings, only: %i[show] do
      resources :chatrooms, only: :show do
        resources :messages, only: :create
      end
      resources :reviews, only: %i[show new create update edit destroy]
    end
  end
  resources :bookings, except: %i[show create] do
    patch :complete, on: :member
    patch :confirm, on: :member
  end
  # resources :chatrooms, only: :show do
  #   resources :messages, only: :create
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
