Rails.application.routes.draw do

  namespace :account do
    resources :faqs
  end
  root to: 'home#index'

  devise_scope :user do get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users

  resources :carts, only: [:show] do
    member do
      post :finish
    end
  end
  
  resources :products, only: [:index, :show] do
    member do
      post :add_to_cart
    end
  end

  resources :faqs, only: [:index]

  resources :orders, only: [:index]

  namespace :account do
    resources :products
    resources :orders, only: [:index, :show, :destroy]
    resources :faqs
    resources :users do
      collection do
        delete :destroy
      end
    end
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
