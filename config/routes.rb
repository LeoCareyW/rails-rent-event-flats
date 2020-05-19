Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :flats do
    resources :bookings, only: [:create, :new, :edit, :update, :destroy]
  end

  resources :bookings, except: [:create, :new]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

