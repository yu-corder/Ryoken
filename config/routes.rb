Rails.application.routes.draw do
  devise_for :accounts, controllers: {
    registrations: 'accounts/registrations',
    sessions: 'accounts/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  

  get 'ryoken/setup', to: 'cooks#main'

  get 'cookposts/new', to: 'cookposts#new'
  post 'cookposts', to:'cookposts#create'
  get 'cookposts', to: 'cookposts#index'
  
  resources :cookposts, only:[:edit, :update]
  get 'cookposts/destroy/:id', to: 'cookposts#destroy'
  get 'cookposts/:id', to: 'cookposts#edit'

  get 'users/new', to: 'users#new'
  post 'users', to: 'users#create'
  get 'users', to: 'users#index'

  resources :users, only:[:edit, :update]

  get 'users/destroy/:id', to: 'users#destroy'
  get 'users/:id', to: 'users#edit'
  
  resources :likes, only:[:destroy]

  post 'likes/:id', to: 'likes#create'
  
  
  root 'cooks#index'
end
