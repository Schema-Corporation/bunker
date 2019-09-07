Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  get 'users/current' => 'users#current'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'documenttypes' => 'documenttypes#index'
end