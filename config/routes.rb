Rails.application.routes.draw do
  resources :search_suggestions

  resources :lists

  get '/lists/new', to: 'lists#new'
  post '/lists', to: 'lists#create'
  get    '/lists/:id/edit', to: 'lists#edit'
  delete '/lists/:id', to: 'lists#destroy'
  get '/lists/:id/edit', to: 'lists#edit'

  resources :users

  get '/', to: 'users#index'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get  '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  root "users#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
