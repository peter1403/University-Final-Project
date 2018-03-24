Rails.application.routes.draw do
  get 'sessions/new'

  root 'users#home'
  get '/index', to: 'users#index'
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
