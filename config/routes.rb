Rails.application.routes.draw do
  root to: 'dashboard#show'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  resources :sessions, only: [:create]
end
