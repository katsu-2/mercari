Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#editshipping"
  resources :items, only:[:index]

  get 'users/logout' => 'users#logout'
  get 'users/editshipping' => 'users#editshipping'
end
