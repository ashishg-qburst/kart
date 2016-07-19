Rails.application.routes.draw do

  get 'products' => 'products#index'

  resources :products

  resources :categories
  
  devise_for :users
  
  root  'static#home'

  get 'about' => 'static'

  get 'contact' => 'static'

end
