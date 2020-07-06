Rails.application.routes.draw do
  namespace :account do
    resources :faqs
  end
  devise_scope :user do get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users
  resources :users
  root to: 'home#index'
  post '/finish', to: 'orders#finish'
  resources :products 
  namespace :account do
    resources :products, only: [:index, :show] do
      member do
        post :add_to_cart
      end
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
