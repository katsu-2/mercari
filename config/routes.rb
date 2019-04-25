Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :omniauth_callbacks => 'users/omniauth_callbacks',
    :sessions => 'users/sessions',
    :registrations => 'users/registrations'
  }


  root "items#index"


  resources :items, only:[:index, :show, :new, :create] do
    collection do
      post :upload_image
      post :get_category_id
    end
    resources :confirmations, only:[:show]
  end


  resources :users, only:[:show]
  resources :logouts, only: [:show]

  namespace :mypages do
    resources :profiles, only:[:show]
    resource :registrations, only: [:new, :create]
    resource :cellphones, only: [:new, :create]
    resource :addresses, only: [:new, :create]
    resource :credits, only: [:new, :create]
    resource :identityinformations, only: [:show]
  end
end

