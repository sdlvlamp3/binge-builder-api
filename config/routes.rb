Rails.application.routes.draw do
  resources :users, :playlists
  post '/login', to: 'sessions#create'

  # Defines the root path route ("/")
  # root "posts#index"
end
