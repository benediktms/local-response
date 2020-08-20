Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :jobs do
    resources :bookings, only: %i[show] do
      resources :reviews, only: %i[show new create update edit destroy]
    end
  end
  resources :bookings, except: :show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
