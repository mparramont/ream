Rails.application.routes.draw do
  resources :items, only: :create

  root to: 'pages#index'
  get 'pages/index'

  namespace :admin do
    resources :users
    resources :items

    root to: "users#index"
  end
  devise_for :users
  resources :users
end
