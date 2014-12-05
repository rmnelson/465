Rails.application.routes.draw do
  resources :tags
  resources :image_users
  resources :images
  devise_for :users, controllers: { registrations: "users/registrations" }

  root to: 'images#index'
end
