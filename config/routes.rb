Rails.application.routes.draw do

  get 'users/index'
  get 'users/show'
  devise_for :users

  devise_for :town_halls

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :villages

end
