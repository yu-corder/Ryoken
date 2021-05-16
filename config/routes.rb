Rails.application.routes.draw do
  devise_for :accounts, controllers: {
    registrations: 'accounts/registrations',
    sessions: 'accounts/sessions',
    confirmations: 'accounts/confirmations',
    passwords: 'accounts/passwords',
    unlocks: 'accounts/unlocks'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  

  get 'ryoken/setup', to: 'cooks#main'

  get 'cookposts/new', to: 'cookposts#new'
  post 'cookposts', to:'cookposts#create'
  
  
  resources :cookposts, only:[:edit, :update]
  get 'cookposts/destroy/:id', to: 'cookposts#destroy'
  get 'cookposts/:id', to: 'cookposts#edit'

  get 'users/new', to: 'users#new'
  post 'users', to: 'users#create'
  get 'users', to: 'users#index'
  get 'users/show/:id', to: 'users#show'
  get 'users/show/:id/:page', to: 'users#show'

  resources :users, only:[:edit, :update]

  get 'users/destroy/:id', to: 'users#destroy'
  get 'users/edit/:id', to: 'users#edit'
  get 'users/:page', to: 'users#index'
  
  resources :likes, only:[:destroy]

  post 'likes/:id', to: 'likes#create'

  post 'comments/:id', to: 'comments#create'
  
  get 'show/:id', to: 'cooks#show'

  get 'mylikes', to: 'likes#index'
  get 'mylikes/:page', to: 'likes#index'

  get '/:page', to: 'cooks#index'
  root to: 'cooks#index'

  resources :cooks do
    collection do
      get 'search'
      get 'search/:page', to: 'cooks#search'
    end
  end
end
