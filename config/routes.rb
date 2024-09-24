Rails.application.routes.draw do

  resource :song, only: [:create, :destroy, :update]
  resource :artist, only: [:create, :update, :destroy, :show]
  resource :playlist, only: [:create, :destroy]
  resources :wishlists, only: [:create, :index] do 
    resource :user_playlist, only: [:create, :destroy]
  end
  resources :collections

  post 'login', to: 'authentication#login'

  post 'signup', to: 'registrations#create'

  delete 'logout', to: 'authentication#destroy'
end
