Rails.application.routes.draw do
  root 'root_page#home'
  get  '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'posts/:id',   to: 'posts#show'
  resources :users
  resources :posts
end