Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :recipes_preview
  resources :full_recipe
  resources :stashes, only: [:index, :show, :create, :destroy]
end
