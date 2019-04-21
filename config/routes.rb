Rails.application.routes.draw do
  get 'carts/new'
  get 'carts/create'
  devise_for :users, :controllers => {
    :sessions => 'users/sessions',
    :registrations => 'users/registrations'
  }


  root "items#index"


  resources :items, only:[:index, :show, :new, :create] do
    resources :confirmations, only:[:show]
    resources :carts, only: [:new,:create]
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

