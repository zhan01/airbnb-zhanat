Rails.application.routes.draw do
  get 'braintree/new'
  get 'welcome/index'
  root 'rooms#index'
  root  'welcome#index'

  resources :users, only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
      resources :rooms
      resources :photos
  end
  post 'braintree/checkout'
  
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  resources :rooms do
    resources :reservations, only: [:create, :new]
  end
  

  get '/preload' => 'reservations#preload'
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

