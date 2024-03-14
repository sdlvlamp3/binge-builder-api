Rails.application.routes.draw do
  resources :users, :playlists 
  resources :sessions, only: [:create]
  post '/login', to: 'sessions#create'

  # Defines the root path route ("/")
  # root "posts#index"
end
