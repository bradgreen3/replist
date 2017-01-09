Rails.application.routes.draw do
  root 'home#index'

  resources :users do
    resources :pieces
    get '/dashboard', to: 'dashboard#show'
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback', to: 'youtube_users#create'

  get '/:slug' => 'dashboard#show'

end
