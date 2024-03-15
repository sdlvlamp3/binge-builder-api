Rails.application.routes.draw do
  resources :users, :playlists, :movie_shows, :genre
  resources :sessions, only: [:create]
  post '/login', to: 'sessions#create'

  # Defines the root path route ("/")
  # root "posts#index"
end
