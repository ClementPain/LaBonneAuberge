Rails.application.routes.draw do
 
  devise_for :town_halls
  root 'static_pages#welcome'
  get 'static_pages/contact', to: 'static_pages#contact'

  devise_for :users, controllers: { sessions: 'users/sessions', passwords: 'users/passwords', registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :villages

end
