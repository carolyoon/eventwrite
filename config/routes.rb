Rails.application.routes.draw do

  get 'sessions/new'

  resources :search 

  resources :users, only: [:new, :show]
  post 'users/new', to: 'search#index'

  resources :sessions, only: [:create, :destroy]

  root 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
