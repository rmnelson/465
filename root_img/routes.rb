Rails.application.routes.draw do
  devise_for :users
 root to: 'root#home'
end
