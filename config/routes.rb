Rails.application.routes.draw do
  resources :story_tags
  resources :tags
  resources :stories
  resources :locations
  resources :users
end
