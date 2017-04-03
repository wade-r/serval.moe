Rails.application.routes.draw do
  root to: "welcome#index"

  resources :comments, only: [ :create, :index ]
end
