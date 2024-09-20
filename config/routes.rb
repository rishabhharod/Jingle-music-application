Rails.application.routes.draw do

  resource :song, only: [:create,:destroy]
  resource :artist, only: [:create,:update,:destroy,:show]
  resource :playlist, only: [:create,:destroy]
  resource :user_playlist, only: [:create,:destroy]
  resources :wishlists, only: [:create,:index]
  resources :collection

  post 'login', to: 'authentication#login'

  post 'signup', to: 'registrations#create'

  delete 'logout', to: 'authentication#destroy'
end
