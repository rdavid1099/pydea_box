Rails.application.routes.draw do
  root 'ideas#index'

  get '/ideas/global', to: 'ideas#global'

  resources :users, only: [:new, :create, :edit, :update, :destroy]
  namespace :users do
    resources :ideas, only: [:index]
  end
  get '/users/:id', to: 'users#show', as: 'user_dashboard'
end
