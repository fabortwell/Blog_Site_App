Rails.application.routes.draw do
  resources :posts
  patch "/posts/:id/like", to: "postss#increment_ratings"
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
