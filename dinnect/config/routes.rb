Rottenpotatoes::Application.routes.draw do
  resources :movies
  get 'directors/search/:title', to: 'movies#search', as: 'search_directors'
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
end
