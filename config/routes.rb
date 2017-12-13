Rails.application.routes.draw do
  resources :items
  resources :polls
  # get 'sessions/new'
  # post   '/login',   to: 'sessions#create'
  # delete '/logout',  to: 'sessions#destroy'

  post 'signup', to: 'users#create'
  post 'authenticate', to: 'authentication#authenticate'
  patch 'broadcast/:id', to: 'presentations#broadcast'
  patch 'next/:id', to: 'presentations#next_slide'
  patch 'prev/:id', to: 'presentations#prev_slide'
  get 'show-presentation/:id', to: 'presentations#show_to_participant'

  resources :users
  resources :presentations

  mount ActionCable.server, at: '/cable'

end
