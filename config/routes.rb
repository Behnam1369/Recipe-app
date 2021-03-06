# frozen_string_literal: true

Rails.application.routes.draw do
  resources :foods
  devise_for :users
  resources :users
  resources :recipies, only: %i[index show new create destroy] do
    resources :recipy_foods, only: %i[create destroy new]
  end

  root to: 'foods#index'

  get '/public_recipes', to: 'recipies#public_recipies'
  get '/shopping_list', to: 'foods#shopping_list'
  post '/public_toggle/:id', to: 'recipies#public_toggle'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
