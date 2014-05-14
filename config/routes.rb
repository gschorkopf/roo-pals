Rails.application.routes.draw do
  root to: 'dashboard#show'
  get '/login', to: 'sessions#new'
  resources :sessions, only: [:create]
end
