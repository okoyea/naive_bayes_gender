Rails.application.routes.draw do
  root 'home#index'
  resources :home, only: [:index, :create]
  resources :people
end
