Rails.application.routes.draw do
  devise_for :accounts, controllers: {
    registrations: 'accounts/registrations',
    sessions: 'accounts/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users, only:[:new, :create]
  get 'ryoken', to: 'cooks#index'
  get 'ryoken/setup', to: 'cooks#main'

  get 'cookposts', to: 'cookposts#new'
  post 'cookposts', to: 'cookposts#create'
  root 'cooks#main'
end
