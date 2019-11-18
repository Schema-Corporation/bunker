# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get "" => redirect("/api-docs")
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }
  namespace 'api' do
    namespace 'v1' do

      get 'booking_processes' => 'booking_processes#index'
      get 'booking_processes/lessees/:lesseeId' => 'booking_processes#lessees'
      get 'booking_processes/:id' => 'booking_processes#show'
      post 'booking_processes' => 'booking_processes#create'
      patch 'booking_processes/:id' => 'booking_processes#update'
      delete 'booking_processes/:id' => 'booking_processes#destroy'

      post 'get_price/:idSpace' => 'booking_processes#price'
      post 'booking_intention/' => 'booking_processes#intention'
      patch 'booking_aprove/:id' => 'booking_processes#aprove'
      patch 'booking_deny/:id' => 'booking_processes#deny'
      resources :booking_processes

      get 'devices' => 'devices#index'
      get 'devices/:id' => 'devices#show'
      post 'devices' => 'devices#create'
      patch 'devices/:id' => 'devices#update'
      delete 'devices/:id' => 'devices#destroy'
      resources :devices

      get 'document_types' => 'document_types#index'
      get 'document_types/:id' => 'document_types#show'
      post 'document_types' => 'document_types#create'
      patch 'document_types/:id' => 'document_types#update'
      delete 'document_types/:id' => 'document_types#destroy'
      resources :document_types

      get 'documents' => 'documents#index'
      get 'documents/:id' => 'documents#show'
      post 'documents' => 'documents#create'
      patch 'documents/:id' => 'documents#update'
      delete 'documents/:id' => 'documents#destroy'
      resources :documents

      get 'lessees' => 'lessees#index'
      get 'lessees/:id' => 'lessees#show'
      post 'lessees' => 'lessees#create'
      patch 'lessees/:id' => 'lessees#update'
      delete 'lessees/:id' => 'lessees#destroy'
      resources :lessees

      get 'lessors' => 'lessors#index'
      get 'lessors/:id' => 'lessors#show'
      post 'lessors' => 'lessors#create'
      patch 'lessors/:id' => 'lessors#update'
      delete 'lessors/:id' => 'lessors#destroy'

      get 'lessors/spaces/:id' => 'lessors#spaces'
      get 'lessors/username/:userId' => 'lessors#username'

      resources :lessors

      get 'locations' => 'locations#index'
      get 'locations/:id' => 'locations#show'
      post 'locations' => 'locations#create'
      patch 'locations/:id' => 'locations#update'
      delete 'locations/:id' => 'locations#destroy'

      get 'locations/spaces/:id' => 'locations#spaces'

      resources :locations

      get 'photos' => 'photos#index'
      get 'photos/:id' => 'photos#show'
      post 'photos' => 'photos#create'
      patch 'photos/:id' => 'photos#update'
      delete 'photos/:id' => 'photos#destroy'
      get 'photos/spaces/:id' => 'photos#spaces'
      resources :photos

      get 'services' => 'services#index'
      get 'services/:id' => 'services#show'
      post 'services' => 'services#create'
      patch 'services/:id' => 'services#update'
      delete 'services/:id' => 'services#destroy'
      resources :services

      get 'space_service_details' => 'space_service_details#index'
      get 'space_service_details/:id' => 'space_service_details#show'
      post 'space_service_details' => 'space_service_details#create'
      patch 'space_service_details/:id' => 'space_service_details#update'
      delete 'space_service_details/:id' => 'space_service_details#destroy'
      resources :space_service_details

      get 'spaces' => 'spaces#index'

      post 'spaces/info_around/' => 'spaces#info_around'

      patch 'spaces/block/:id' => 'spaces#block'
      patch 'spaces/unblock/:id' => 'spaces#unblock'
      get 'spaces/:id' => 'spaces#show'
      post 'spaces' => 'spaces#create'
      patch 'spaces/:id' => 'spaces#update'
      delete 'spaces/:id' => 'spaces#destroy'

      get 'spaces/lessors/:id' => 'spaces#lessors'
      get 'spaces/first_photo/:id' => 'spaces#first_photo'
      get 'spaces/info/:id' => 'spaces#info'
      get 'spaces/info_lessors/:id' => 'spaces#info_lessors'

      post 'spaces/complete/' => 'spaces#create_complete'

      resources :spaces

      get 'users' => 'users#index'
      get 'users/:id' => 'users#show'
      post 'users' => 'users#create'
      patch 'users/:id' => 'users#update'
      delete 'users/:id' => 'users#destroy'
      resources :users
      
    end
  end
end