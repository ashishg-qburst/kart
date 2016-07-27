Rails.application.routes.draw do
  
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :admins
  get 'orders/create'

  resources :items

  resources :orders, only: [:create]

  resources :reviews, only: [:create]

  resource :carts

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
