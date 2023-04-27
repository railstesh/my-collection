Rails.application.routes.draw do
  root 'home#index'

  resources :images
  resources :comments, only: [:create]
  resources :collections
  resources :picture_of_the_day

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
