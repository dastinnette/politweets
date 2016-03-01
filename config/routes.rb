Rails.application.routes.draw do
  root 'welcome#index'

  resources :tweets, only: [:index, :show]
  resources :users, only: [:show]

  get '/auth/twitter', as: :login
  get '/auth/twitter/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
