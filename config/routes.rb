Rails.application.routes.draw do
  root 'main#index'

  get "sign_up", to: "users#new"
  post "sign_up", to: "users#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  delete "logout", to: "sessions#destroy"

  get "users/:id/dashboard", to: "users#dashboard", as: "dashboard"

  get "reply/:lesson_id/comments/:id", to: "comments#reply", as: "reply"

  resources :users

  resources :lessons do
    resources :sections
    resources :comments
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
