Rails.application.routes.draw do
  resources :items
  resources :polls
  # get 'sessions/new'
  # post   '/login',   to: 'sessions#create'
  # delete '/logout',  to: 'sessions#destroy'

  post 'signup', to: 'users#create'
  post 'authenticate', to: 'authentication#authenticate'
  patch 'broadcast/:id', to: 'presentations#broadcast'
  get 'show-presentation/:id', to: 'presentations#show_to_participant'

  resources :users
  resources :presentations

end
