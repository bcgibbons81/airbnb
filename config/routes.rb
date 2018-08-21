Rails.application.routes.draw do

  #require 'sidekiq/web'
 #mount Sidekiq::Web => 'sidekiq'

  
  get 'braintree/new'
  get 'welcome/index'
  root 'listings#index'
  resources "listings" do
    resources :reservations
  end

  root 'welcome#index'

  post 'braintree/checkout' 


  get '/auth/:provider/callback', to: 'sessions#create_from_omniauth'

  resources :users, only: [:create, :edit, :update, :destroy, :show] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end