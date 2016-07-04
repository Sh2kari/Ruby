Rails.application.routes.draw do
  root 'weekdays#index'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  namespace :api do
    namespace :v1 do
      resources :orders, only: :index
      resources :auth_tokens, only: :create
    end
  end

  resources :weekdays, only: :index do
    resources :products, only: [:new, :create]
    resources :orders, only: [:index, :new, :create]
  end

  namespace :users do
    resources :profile, only: [:index, :edit, :update], controller: :profile
  end
end
