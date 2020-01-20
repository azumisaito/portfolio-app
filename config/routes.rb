Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'informations#index'
  get '/about', to: 'informations#about'

  resources :users

  resources :inquiries, only: [:new, :create]

  resources :works, only: [:index, :show] 
    namespace :admin do
      resources :works, only: [:new, :create, :edit, :update, :destroy]
    end
  end
