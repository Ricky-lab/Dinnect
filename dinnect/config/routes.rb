Dinnect::Application.routes.draw do
  resources :users, only: [:new, :create, :show]

  # Custom user routes
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Other routes (if any)
  root to: 'sessions#new' # You can specify a different controller/action for the root path
end
