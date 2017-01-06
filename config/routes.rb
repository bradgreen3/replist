Rails.application.routes.draw do
  root 'home#index'

  resources :users do
    resources :pieces
  end

  get '/dashboard', to: 'dashboard#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
