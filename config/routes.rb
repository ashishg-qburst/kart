Rails.application.routes.draw do
  
  devise_for :users
  
  root  'static#home'

  get 'about' => 'static'

  get 'contact' => 'static'

end
