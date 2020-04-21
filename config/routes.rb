Rails.application.routes.draw do
  root 'root_page#home'
  get  '/signup', to: 'users#new'
  resources :users
  resources :posts
end