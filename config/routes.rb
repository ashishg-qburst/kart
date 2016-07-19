Rails.application.routes.draw do

  get 'products' => 'products#index'

  resources :products

  resources :categories
  
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  
  root  'static#home'

  get 'about' => 'static'

  get 'contact' => 'static'

end
