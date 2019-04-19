Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :sessions => 'users/sessions',
    :registrations => 'users/registrations',
    :omniauth_callbacks => 'users/omniauth_callbacks'
  }



  root "items#index"


  resources :items, only:[:index, :show, :new] do
    resources :confirmations, only:[:show]
end


  resource :users, only:[:show] do
    resource :profiles, only:[:show]
    resource :registrations, only: [:new, :create]
    resource :cellphones, only: [:new, :create]
    resource :addresses, only: [:new, :create]
    resource :payments, only: [:new, :create]
    resource :identityinformations, only: [:show]
  end

  get "logout" => 'logouts#destory'

end

