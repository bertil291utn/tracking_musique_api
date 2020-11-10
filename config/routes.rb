Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[show create update destroy]
      get 'user_artists/:id', to: 'users#user_artists'
      resources :tokens, only: [:create]
      post 'valid_token', to: 'tokens#valid_token'
      resources :artists
      resources :stats
      get 'user_artist_stats', to: 'artists#user_artist_stats'
    end
  end
end
