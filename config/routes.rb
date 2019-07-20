Rails.application.routes.draw do
  root to: 'pages#index'
  get 'pages/index'
  namespace :admin do
      resources :users

      root to: "users#index"
    end
  devise_for :users
  resources :users
end
