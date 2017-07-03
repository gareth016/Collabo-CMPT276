Rails.application.routes.draw do
  resources :posts do
  	resources :comments
  end
  
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'welcome', to: 'welcome#index'
  # get 'posts', to: ''
  root 'welcome#index'
end
