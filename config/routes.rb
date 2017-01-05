Rails.application.routes.draw do
  resources :users
  get '/dashboard', to: 'dashboard#show'
end
