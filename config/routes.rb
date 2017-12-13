Rails.application.routes.draw do
  resources :items
  resources :polls
  # get 'sessions/new'
  # post   '/login',   to: 'sessions#create'
  # delete '/logout',  to: 'sessions#destroy'

  post 'signup', to: 'users#create'
  post 'authenticate', to: 'authentication#authenticate'
  patch 'broadcast/:id', to: 'presentations#broadcast'

  resources :users
  resources :presentations

end
