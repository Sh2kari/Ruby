Rails.application.routes.draw do
  resources :weekdays, only: [:index, :show] do
    resources :products
  end

  root 'weekdays#index'
end
