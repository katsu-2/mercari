Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"
  resources :users
  resources :items, only:[:index]
  resources :signups, only: [:new, :create]
  resources :registrations, only: [:new, :create]
  resources :cellphones, only: [:new, :create]


end
