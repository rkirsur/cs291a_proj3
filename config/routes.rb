Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :comments
  end
  resource :session
  resource :user

  get "/login", to: "users#new"
  post "/login", to: "users#create"
  get "/logout", to: "sessions#logout"
  # post "/logout", to: "sessions#destroy"

  # get "/posts/:id", to: "posts#show"

  # Defines the root path route ("/")
  root "posts#index"
end
