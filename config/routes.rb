Rails.application.routes.draw do
  
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :admins
  get 'orders/create'

  resources :orders, only: [:create]

  resources :reviews, only: [:create]

  resource :cart, only: [:show] do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
  end  

  get 'carts/show'

  resources :products

  resources :categories
  
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  
  root  'static#home'

  get 'about' => 'static'

  get 'contact' => 'static'

end
