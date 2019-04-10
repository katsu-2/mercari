Rails.application.routes.draw do
  devise_for :users, skip: :all
  devise_scope :user do
    #ログイン
    get "login" => "users/sessions#new", as: :new_user_session
    #サインアップ
    get  "signup" => "users/registrations#signup"
    post "signup/registration" => "users/registrations#registration"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"
  resources :users
  resources :items, only:[:index]

end
