Rails.application.routes.draw do
  root to: 'dashboard#show'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  resources :schedules, only: [:create, :update]
  resources :sessions, only: [:create]
  resources :users, only: [:create]
end
