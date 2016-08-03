Rails.application.routes.draw do

  root 'pages#home'

  devise_for :users

  resources :users, only: [:show]
  resources :items
  resources :photos

  resources :items do
    resources :bookings, only: [:create]
  end

end
