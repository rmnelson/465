Rails.application.routes.draw do
 get 'pages/new', to: 'pages#new', as: 'new_doi_base'
 post 'pages', to: 'pages#create'
 root to: 'pages#home'
end
