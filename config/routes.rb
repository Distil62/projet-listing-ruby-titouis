# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, format: 'json' do
    namespace :v1 do
      # Authentication
      post 'auth_user' => 'auth#authenticate_user'

      # Listings
      post 'annonce/create', to: 'annonce#create'
      post 'annonce/update/:id', to: 'annonce#update'
      get 'annonce/delete/:id', to: 'annonce#delete'
      get 'annonce/get/:id', to: 'annonce#get'
      get 'annonce/', to: 'annonce#index'
      root 'annonce#index'

      # Category
      get 'category/', to: 'category#index'
      get 'category/id/:id', to: 'category#get_id'
      get 'category/name/:name', to: 'category#get_name'
      post 'category/create', to: 'category#create'

      # User
      get 'account/', to: 'user#index'
      get 'account/:id', to: 'user#get'
    end
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homepage#index'
  resource :listings
  post '/listings/contact', to: 'contact#contact'
  get 'listings_details', action: :detail, controller: 'listings'
end
