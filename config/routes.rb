Rails.application.routes.draw do
  resources :weekdays, only: [:index, :show]

  root 'weekdays#index'
end
