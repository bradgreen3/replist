Rails.application.routes.draw do
  root 'home#index'

  resources :users do
    get '/dashboard', to: 'dashboard#show'
    resources :pieces
  end


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
