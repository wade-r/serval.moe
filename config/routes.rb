Rails.application.routes.draw do
  root to: "welcome#index"

  resources :posts, only: [ :create ]
end
