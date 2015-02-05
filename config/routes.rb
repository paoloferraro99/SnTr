MAST::Application.routes.draw do



  root to: 'welcome#index'
  
  devise_for :users


  resources :users, only: [:show]
  resources :subscriptions, only: [:index, :show, :new, :create, :destroy]
  resources :destinations, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :subscribe, only: [:new, :create]

  resource :cart, only: [:create, :destroy, :show] do
    put 'add/:destination_id', to: 'carts#add', as: :add_to
    put 'remove/:destination_id', to: 'carts#remove', as: :remove_from
  end
  
  resources :purchases, only: [:new, :create]





end
