Rails.application.routes.draw do
  root 'welcome#index'
 resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  get "login" => "sessions#new", :as => "login"
  get "sign_up" => "users#new", :as => "sign_up"
  get "logout" => "sessions#destroy", :as => "logout"
end
