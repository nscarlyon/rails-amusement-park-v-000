Rails.application.routes.draw do

resources :users
get '/signin', to: 'sessions#new'
post '/signin', to: 'sessions#create'
delete '/logout', to: 'sessions#delete'
post '/rides/new', to: 'rides#new'
resources :attractions
resources :rides

root to: 'users#index'
end
