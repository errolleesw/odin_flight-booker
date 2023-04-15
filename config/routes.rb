Rails.application.routes.draw do
  resources :passenger_bookings
  resources :passengers
  resources :bookings
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :flights
  resources :airlines
  resources :airports

  root 'flights#index'
end
