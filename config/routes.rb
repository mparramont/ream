Rails.application.routes.draw do
  resources :items, only: :create

  namespace :admin do
    resources :users
    resources :items

    root to: "users#index"
  end

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
