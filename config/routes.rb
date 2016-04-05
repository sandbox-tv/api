Rails.application.routes.draw do
  match '*all', to: 'application#options', via: [:options]


  resources :users, only: [] do
    resource :channel, only: [:show]
    get 'dashboard', to: 'dashboard#show'
  end

  resources :channels, only: [:index]

  get 'user', to: 'users#show'
  post 'register', to: 'users#create'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
end
