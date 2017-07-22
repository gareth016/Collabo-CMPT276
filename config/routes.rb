Rails.application.routes.draw do
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'welcome', to: 'welcome#index'
  get 'start', to:  'welcome#start'
  get 'profile', to: 'welcome#profile'
  # get 'posts', to: ''
  root 'welcome#index'

  get 'groups/index'
  get 'groups/create'

  resources :groups do
    resources :posts, only:[:create, :destroy]
    get 'join', on: :member
  end 

  resources :posts do
  	resources :comments, only: [:create, :destroy]
  end
  
  
  get 'tags/:tag', to: 'posts#index', as: "tag"


end
