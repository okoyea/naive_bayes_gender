Rails.application.routes.draw do
  root 'gender_classifiers#index'
  resources :gender_classifiers
  resources :people
end
