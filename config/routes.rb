Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/drinks', to: 'drinks#index'
  get '/drinks/:id', to: 'drinks#show'
  get '/bars/new', to: 'bars#new'
  get '/bars', to: 'bars#index'
  get '/bars/:id', to: 'bars#show'
  get '/bars/:bar_id/drinks', to: 'bar_drinks#index'
  post '/bars', to: 'bars#create'
end
