Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :sessions => 'users/sessions',
    :registrations => 'users/registrations'
  }


  root "items#index"


  resources :items, only:[:index, :show, :new, :create] do
    resources :confirmations, only:[:show]
  end


  resources :users, only:[:show]


  namespace :mypages do
    resources :profiles, only:[:show]
    # resources :logouts, only: [:index]
    resource :registrations, only: [:new, :create]
    resource :cellphones, only: [:new, :create]
    resource :addresses, only: [:new, :create]
    resource :credits, only: [:new, :create]
    resource :identityinformations, only: [:show]
  end

  get "logout" => 'logouts#show'

end

