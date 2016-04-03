Rails.application.routes.draw do
  match '*all', to: 'application#options', via: [:options]

  post 'register', to: 'users#create'
  get 'user', to: 'users#show'

  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
end
