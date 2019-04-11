Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :sessions => 'users/sessions',
    :registrations => 'users/registrations'
  }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"
  resource :users, only:[:show] do
    resource :profiles, only:[:show]
    resource :registrations, only: [:new, :create]
    resource :cellphones, only: [:new, :create]
    resource :addresses, only: [:new, :create]
    resource :payments, only: [:new, :create]
  end

  resources :items, only:[:index]


end

