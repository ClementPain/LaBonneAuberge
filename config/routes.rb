Rails.application.routes.draw do
 
  devise_for :town_halls, controllers: { sessions: 'town_halls/sessions', passwords: 'town_halls/passwords', registrations: 'town_halls/registrations' }
  devise_for :users, controllers: { sessions: 'users/sessions', passwords: 'users/passwords', registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :villages

end
