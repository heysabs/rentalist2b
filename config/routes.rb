Rails.application.routes.draw do

  root 'pages#home'

  devise_for :users

  resources :users, only: [:show]
  resources :items
  resources :photos

  resources :items do
    resources :bookings, only: [:create]
  end

  get '/preload' => 'bookings#preload'
  get '/preview' => 'bookings#preview'

  get '/your_rentals' => 'bookings#your_rentals'
  get '/your_reservations' => 'bookings#your_reservations'

  get '/search' => 'pages#search'

end
