Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :flats do
    resources :bookings, only: [:create, :new, :edit, :update, :destroy]
    resources :reviews, only: [ :new, :create ]
  end

  resources :bookings, except: [:create, :new]
  resources :reviews, only: [ :destroy ]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

