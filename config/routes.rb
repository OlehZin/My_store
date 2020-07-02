Rails.application.routes.draw do
  namespace :account do
    resources :faqs
  end
  devise_scope :user do get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users
  resources :users
  root to: 'home#index'
  resources :products, only: [:index, :show]
  namespace :account do
    resources :products
  end
  post '/add_to_order/:product_id' => 'order#add_to_order', :as => 'add_to_order'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
