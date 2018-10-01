Rails.application.routes.draw do
  resources :story_tags
  resources :tags
  resources :stories
  resources :locations
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
