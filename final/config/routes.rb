Rails.application.routes.draw do
  get 'start/index'
  get 'start/map'
  post 'start/upload'

  resources :ssids do
        resources :pollpoints, :shallow => true
        resources :acls, :shallow => true
  end
  resources :gpspoints
  devise_for :users
  root to: 'start#index'
end
