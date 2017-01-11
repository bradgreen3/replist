Rails.application.routes.draw do
  root 'home#index'

  resources :users do
    get '/dashboard', to: 'dashboard#show'
    resources :pieces do
      resources :youtube_uploads, only: [:new, :create]
    end
  end

  resources :youtube_comments, only: [:index]
  resources :youtube_likes, only: [:create]
  resources :youtube_dislikes, only: [:create]
  resources :youtube_deletes, only: [:create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback', to: 'youtube_users#create'

  get '/:slug' => 'dashboard#show'

end
