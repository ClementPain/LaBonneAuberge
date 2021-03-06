Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :town_halls, controllers: { sessions: 'town_halls/sessions', passwords: 'town_halls/passwords', registrations: 'town_halls/registrations', confirmations: 'town_halls/confirmations' }
  resources :manage_registration_town_halls, only: [:new, :create]
  resources :town_halls, only: [:show]
  
  root 'static_pages#welcome'
  get 'static_pages/contact', to: 'static_pages#contact'

  devise_for :users, controllers: { sessions: 'users/sessions', passwords: 'users/passwords', registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :villagers, only: [:show, :edit, :update] do
    resources :associate_villagers, only: [:new, :create]

    resources :conversations, only: [:index, :create] do
      resources :messages, only: [:index, :create]
    end
  end

  resources :villages do
    resources :validation_town_halls, only: [:create, :destroy]
    resources :forums do
      resources :forums_posts do
        resources :forums_posts_comments, except: [:index, :show]
      end
    end
  end

  resources :events do
    resources :attendances, only: [:new, :show, :create, :destroy]
    resources :charges, only: [:new, :create]

    resources :comments do
      resources :likes
    end

  end

  resources :offers do
    get 'offers/search', to: 'offers#search'
    resources :offers_comments
  end

  resources :categories, except: [:index, :show]



end