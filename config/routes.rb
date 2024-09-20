Rails.application.routes.draw do

  resource :song, only: [:create,:destroy]
  resource :artist, only: [:create,:update,:destroy]
  resource :collection, only: [:create,:update,:destroy]
  resource :playlist, only: [:create,:destroy]

  post 'login', to: 'authentication#login'

  post 'signup', to: 'registrations#create'

  delete 'logout', to: 'authentication#destroy'
end
