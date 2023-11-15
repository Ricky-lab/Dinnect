Dinnect::Application.routes.draw do
  get 'events/index'
  resources :users, only: [:new, :create, :show]

  # Custom user routes
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :profiles, only: [:new, :create,:show]

  resources :events, only: [:index]

  # Inside config/routes.rb
  # get 'users/:id/my_events', to: 'users#my_events', as: 'user_events'

  resources :users do
    member do
      get :my_events
    end
  end

  # Other routes (if any)
  root to: 'application#redirect_based_on_login'
  
end
