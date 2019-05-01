Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :sessions => 'users/sessions',
    :registrations => 'users/registrations'
  }


  root "items#index"


  resources :items, only:[:index, :show, :new, :create, :update, :edit, :destroy] do
    resources :carts, only: [:new,:create]
    collection do
      post :upload_image
      post :get_category_id
    end
  end

  resources :categories, only: [:show]
  resources :searches, only: [:index, :create]
  get 'search' => 'searches#search'
  resources :users, only:[:show]
  resources :logouts, only: [:index]

  namespace :mypages do
    resources :profiles, only:[:show]
    resources :editshippings, only:[:show]
    resource :registrations, only: [:new, :create]
    resource :cellphones, only: [:new, :create]
    resource :addresses, only: [:new, :create]
    resources :credits, only: [:index, :new, :create]
    resources :informations, only: [:show]
    resources :lists, only: [:show]
  end
end

