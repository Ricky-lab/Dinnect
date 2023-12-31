Dinnect::Application.routes.draw do
  get 'events/index'
  resources :users, only: [:new, :create, :show]

  # Custom user routes
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :profiles

  resources :events, only: [:index, :create, :new, :show, :edit, :update] do
    post 'join', on: :member
    delete 'leave', on: :member
    patch 'cancel', on: :member
    delete 'remove_participant/:user_id', to: 'events#remove_participant', on: :member, as: 'remove_participant'
  end
  

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
