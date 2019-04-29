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

  resources :searches, only: [:index, :create]
  resources :users, only:[:show]
  resources :logouts, only: [:index]

  namespace :mypages do
    resources :profiles, only:[:show]
    resource :registrations, only: [:new, :create]
    resource :cellphones, only: [:new, :create]
    resource :addresses, only: [:new, :create]
    resources :credits, only: [:index, :new, :create]
    resource :identityinformations, only: [:show]
  end
end

