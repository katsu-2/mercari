Rails.application.routes.draw do
  devise_for :users, skip: :all
  devise_scope :user do
    #ログイン
    get "login" => "users/sessions#new", as: :new_user_session
    post "login" => "users/sessions#create"
    #サインアップ
    get "signup" => "users/registrations#signup", as: :new_user_registration

    get "/signup/registration" => "users/registrations#registration"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"
  resources :users
  resources :items, only:[:index]
  resources :sessions, only: [:new, :create]
  resources :signups, only: [:new, :create]
  resources :registrations, only: [:new, :create]


end
