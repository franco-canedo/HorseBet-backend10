Rails.application.routes.draw do
  resources :hypes
  resources :boos
  resources :wins
  resources :game_winners
  resources :user_horses
  resources :game_users
  resources :game_horses
  resources :horses
  resources :games
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  # get '/welcome', to: 'welcome#index'
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/users', to: 'users#index'
      post '/users/deposit', to: 'users#deposit'
      post '/users/withdraw', to: 'users#withdraw'
      patch 'users/edit', to: 'users#edit'
      get 'users/leaderboard', to: 'users#leaderboard'
    end
  end

  get '/users', to: 'users#index'
  get '/activeGames', to: 'games#active'
  get '/joinableGames', to: 'games#joinable'
  post '/boo', to: 'boos#create'
  post '/newGame', to: 'games#create'
  post '/joinGame', to: 'game_users#join'
  post '/userHorse', to: 'user_horses#create'
  post '/hype', to: 'hypes#create'
  post '/winner', to: 'game_winners#winner'
  

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
  
end
