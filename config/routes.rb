Rails.application.routes.draw do
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :tags, only: [:show]
  # resources :story_tags
  resources :stories, only: [:index, :show, :show, :new, :create, :edit, :update, :destroy]
  resources :locations, only: [:index, :show]

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "sessions", to: "sessions#create", as: "sessions"
  delete "sessions", to: "sessions#destroy"
  
end
