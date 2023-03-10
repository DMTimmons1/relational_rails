Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/teams', to: 'teams#index'
  get '/teams/new', to: 'teams#new'
  get '/teams/:id', to: 'teams#show'
  get '/teams/:team_id/players', to: 'team_players#index'
  get '/teams/:team_id/players/new', to: 'team_players#new'
  post '/teams/:team_id/players', to: 'team_players#create'
  post '/teams', to: 'teams#create'
  get '/teams/:id/edit', to: 'teams#edit'
  get '/players', to: 'players#index'
  get '/players/:id', to: 'players#show'
  patch '/teams/:id', to: 'teams#update'
  delete '/teams/:id', to: 'teams#destroy'
  post '/players/:id/edit', to: 'players#edit'
  get '/players/:id/edit', to: 'players#edit'
  patch 'players/:id', to: 'players#update'
end
