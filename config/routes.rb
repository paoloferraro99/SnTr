MAST::Application.routes.draw do

  root to: 'welcome#index'
  
  devise_for :users


  resources :users, only: [:show]
  resources :subscriptions, only: [:index, :show, :new, :create, :destroy]
  resources :destinations, only: [:index]
  





end
