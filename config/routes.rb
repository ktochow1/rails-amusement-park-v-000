Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  'static#index'
  resources :users
  # resources :sessions
  get '/signin' => 'sessions#new'
  post '/sessions/create' => 'sessions#create'
  get '/signout' => 'sessions#destroy'



end
