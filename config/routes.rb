Rails.application.routes.draw do
  root 'ideas#index'

  get '/ideas/global', to: 'ideas#global'

  resources :users, only: [:new, :create, :edit, :update, :destroy]
  namespace :users do
    resources :ideas, only: [:index]
  end
  get '/users/:id', to: 'users#show', as: 'user_dashboard'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
