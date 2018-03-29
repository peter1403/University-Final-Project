Rails.application.routes.draw do
  get '/siteInfo', to: 'info_pages#siteInfo'
  get '/about', to: 'info_pages#about'
  get '/help', to: 'info_pages#help'
  get '/siteRules', to: 'info_pages#siteRules'
  get '/random', to: 'contents#random'
  get '/top', to: 'contents#top'

  root 'users#home'
  get '/index', to: 'users#index'
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  get 'login',  to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users do
    resources :contents, shallow: true
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
