# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'groups#home'
  get '/signup', to: 'users#new'
  resources :users, only: %i[show create]
  resources :groups, only: %i[index new create show]
  resources :transactions, only: %i[index new create show]

  get '/externaltransaction', to: 'transactions#external'
  get '/withgrouptransaction', to: 'transactions#withoutgroup'


  get    '/login' => 'sessions#new'
  post   '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
end
