Rails.application.routes.draw do
  root 'diys#index'

  resources :diys
  resources :users, only: [:index]

  post '/add', to: 'diys#add'
end
