Rails.application.routes.draw do
  
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :admins
  get 'orders/create'

  resources :orders, only: [:create]

  resources :reviews, only: [:create]

  resource :cart, only: [:show] do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
    get 'buy/:product_id', to: 'carts#buy', as: :buy
  end  

  get 'carts/show'

  resources :products

  authenticate :user do
    resources :categories, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :categories, only: [:index, :show]
  
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  
  root  'static#home'

  get 'about' => 'static'

  get 'contact' => 'static'

end
