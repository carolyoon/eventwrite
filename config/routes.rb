Rails.application.routes.draw do

  resources :search 

  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]

  resources :events, only: [:index, :show]


  root 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
