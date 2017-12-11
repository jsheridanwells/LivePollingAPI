Rails.application.routes.draw do
  resources :presentations
  get 'sessions/new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  post 'signup', to: 'users#create'
  post 'authenticate', to: 'authentication#authenticate'

  resources :users

end
