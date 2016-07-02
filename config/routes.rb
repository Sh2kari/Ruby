Rails.application.routes.draw do
  root 'weekdays#index'

  devise_for :users

  resources :weekdays, only: :index do
    resources :products
    resources :orders, only: [:index, :new, :create]
  end

  namespace :users do
    resources :profile, only: [:edit, :update], controller: :profile
  end
end
