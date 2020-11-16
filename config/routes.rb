Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :flats, only: %i[index show new create edit update] do
    resources :bookings, only: %i[new create destroy]
  end
  resources :bookings
  resources :clients, only: %i[new create index show]
end
