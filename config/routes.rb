Rails.application.routes.draw do


  devise_for :users
  devise_scope :user do

    #サインアップ
    get "signup" => "users/registrations#signup"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"
  resources :users, only:[:show]
  resources :items, only:[:index]
  get 'users/:id/editprofile' => 'users#editprofile'
end

