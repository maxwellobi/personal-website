Rails.application.routes.draw do
  get 'articles/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :sudo do
    
    get '/register', to: 'register#index'
    post '/register', to: 'register#create'

    get '/login', to: 'login#index'
    post '/login', to: 'login#create'
    delete '/login', to: 'login#destroy'

    resources :articles

    root 'login#index'
  end

  resources :articles
  get '/articles/tags/:tag', to: 'articles#tag'
  get '/about', to: 'user#about'

  root 'articles#index'
end
