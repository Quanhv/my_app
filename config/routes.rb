Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'static_pages/home', as: 'home'

  get 'static_pages/help', as: 'help'

  get 'static_pages/about', as: 'about'
  get '/signup', to: 'users#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
