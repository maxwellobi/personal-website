Rails.application.routes.draw do
  get 'articles/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :sudo do
    
    get '/register', to: 'register#index'
    post '/register', to: 'register#create'

    get '/login', to: 'login#index'
    post '/login', to: 'login#create'

    root 'login#index'
  end

  # get '/admin', to: 'login#index'
end
