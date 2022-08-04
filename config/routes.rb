Rails.application.routes.draw do

  resources :posts
  patch "/posts/:id/like", to: "postss#increment_ratings"
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
