# frozen_string_literal: true

Rails.application.routes.draw do
  resources :foods
  devise_for :users
  resources :users
  resources :recipies, only: %i[index show new create destroy]

  root to: 'users#index'

  get '/public_recipes', to: 'recipies#public_recipies'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
