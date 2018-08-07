Rails.application.routes.draw do

  root to: 'staticpages#index'

  resources :users

  #get '/club', to: 'staticpages#club'
  get 'users/new', to: 'users#new'
  post 'users/new', to: 'users#create', as: "sign_up"
  #get 'sessions/new', to: 'sessions#new'
  #post 'sessions/new', to: 'sessions#create', as: "login"
  get 'sessions/:id', to: 'sessions#show', as: "show"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: "logout"

  get 'secret_page/:id', to: 'sessions#secret_page', as: "secret_page"

  get 'show_secret/:id', to: 'sessions#show_secret', as: "show_secret"
  #get    '/login',   to: 'sessions#new'
  #post   '/login',   to: 'sessions#create'
  #get '/sessions/:id', to: 'sessions#show', as: "show_id"
  #post '/users/new', to: 'users#create', as: "sign_up"



end
