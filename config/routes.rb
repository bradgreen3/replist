Rails.application.routes.draw do
  resources :users

  get '/dashboard', to: 'dashboard#show'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
