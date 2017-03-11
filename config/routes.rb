Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'youtube_users#create'
  get 'auth/failure', to: redirect('/')

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
  end

  namespace :api do
    namespace :v1 do
        get 'youtube/comments', to: 'youtube#comments'
        delete 'youtube/delete', to: 'youtube#destroy'
        patch 'youtube/like', to: 'youtube#like'
        patch 'youtube/dislike', to: 'youtube#dislike'
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/:slug' => 'dashboard#show'

end
