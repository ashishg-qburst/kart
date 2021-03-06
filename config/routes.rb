Rails.application.routes.draw do
  
  devise_for :admins
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" } 

  post '/rate' => 'rater#create', :as => 'rate'
  get 'orders/create'
  get '/search', to: 'search#index'

  resources :items

  resources :users, only: [:show]

  resources :orders, only: [:create]

  resources :reviews, only: [:create, :destroy]

  resources :carts

  resources :products

  authenticate :user do
    resources :categories, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :categories, only: [:index, :show]
  
  root  'static#home'

  get 'about' => 'static'

  get 'contact' => 'static'

end