Rails.application.routes.draw do

  root "items#index"
  devise_for :users
  resources :items
  resources :orders, only: [:index, :create]
end
