Rails.application.routes.draw do
  resources :images do
	resources :acls, :shallow => true
	resources :tags, :shallow => true
  end
  get '/images/:image_id/click' => 'images#click', as: 'image_click'
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  root to: 'images#index'
end
