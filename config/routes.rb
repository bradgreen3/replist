Rails.application.routes.draw do
  root 'home#index'

  resources :users do
    get '/dashboard', to: 'dashboard#show'

    resources :performances do
      resources :performance_pieces, only: [:new, :create]
    end

    resources :pieces do
      resources :youtube_uploads, only: [:new, :create]
    end
  end

  namespace :youtube do
    resources :comments, only: [:index]
    resources :likes, only: [:create]
    resources :dislikes, only: [:create]
    resources :deletes, only: [:create]
  end

  namespace :api do
    namespace :v1 do
        post 'youtube/delete', to: 'youtube#delete'
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback', to: 'youtube_users#create'

  get '/:slug' => 'dashboard#show'

end
