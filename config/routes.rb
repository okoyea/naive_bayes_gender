Rails.application.routes.draw do
  root 'home#index'
  resources :home, only: :index do
    collection do
      post :get_prediction
    end
  end
  resources :people
end
