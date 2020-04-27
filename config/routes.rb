Rails.application.routes.draw do
  root 'root_page#home'
  get  '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'posts/new',   to: 'posts#new'
  get 'posts/:id',   to: 'posts#show'
  get 'users/edit',   to: 'users#edit'
  get '/liked_index', to: 'posts#liked_index'
  post   '/like/:post_id', to: 'likes#like',   as: 'like'
  delete '/like/:post_id', to: 'likes#unlike', as: 'unlike'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :posts
end