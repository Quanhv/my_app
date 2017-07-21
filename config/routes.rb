Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'static_pages/home', as: 'home'

  get 'static_pages/help', as: 'help'

  get 'static_pages/about', as: 'about'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get'/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :password_resets

  resources :microposts, only: [:create, :destroy, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
