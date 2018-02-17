Rails.application.routes.draw do

  get 'sessions/new'

  resources :search 

  resources :users, only: [:new, :show]

  resources :sessions, only: [:create, :destroy]

  root 'search#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
