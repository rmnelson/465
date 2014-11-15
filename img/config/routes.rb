Rails.application.routes.draw do
  resources :images do
	resources :acls, :shallow => true
	resources :tags, :shallow => true
  end
  get '/images/:image_id/click' => 'images#click', as: 'image_click'
  devise_for :users
  root to: 'images#index'
end
