Rails.application.routes.draw do
  get 'start/index'
  get 'start/map'
  post 'start/upload'
  get 'start/clear_all'
  get 'start/samples'

  resources :ssids do
        resources :pollpoints, :shallow => true
        resources :acls, :shallow => true
  end
  get '/ssids/:ssid_id/show_more' => 'ssids#show_more', as: 'show_more'
  resources :gpspoints
  devise_for :users
  root to: 'start#index'
end
