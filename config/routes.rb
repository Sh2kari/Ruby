Rails.application.routes.draw do

  resources :weekdays, only: [:index, :show] do
    resources :products
    resources :orders, only: :index
    resources :order_products, only: :create
  end

  root 'weekdays#index'
end
