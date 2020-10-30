Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[show create update destroy]
      get 'user_artists/:id', to: 'users#user_artists'
      resources :tokens, only: [:create]
      resources :artists
      resources :stats
    end
  end
end
