Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[show create]
      resources :tokens, only: [:create]
      resources :artists, only: %i[show index create]
    end
  end
end
