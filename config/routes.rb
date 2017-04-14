Rails.application.routes.draw do
  resources :homes
  get 'pages/landing'

  root 'pages#landing'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
