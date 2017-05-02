Rails.application.routes.draw do
  get 'pages/landing'
  root 'pages#landing'

  resources :homes do
    member do
      post 'favorite'
      post 'unfavorite'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  mount Shrine::DownloadEndpoint => "/attachments"
end
