#!/bin/bash

rails new img
cd img
echo "
gem 'devise'
gem 'better_errors'
" >> Gemfile
bundle install
rails generate devise:install
rails g devise user name:string
rails g scaffold image filename:string private:boolean user:references
rails g scaffold Tag tag_string:string image:references
rails g scaffold acl image:references user:references
rails g devise:views
rails g devise:controllers user
rake db:migrate
cat << EOF >> ./app/views/devise/registrations/new.html.erb
<h2>Sign up</h2>

<%= form_for(resource, as: resource_name, url: registration_path(resource_name)) do |f| %>
  <%= devise_error_messages! %>

<div class="field">
    <%= f.label :name %><br />
    <%= f.name_field :name, autofocus: true %>
  </div>

  <div class="field">
    <%= f.label :email %><br />
    <%= f.email_field :email, autofocus: true %>
  </div>

  <div class="field">
    <%= f.label :password %>
    <% if @validatable %>
    <em>(<%= @minimum_password_length %> characters minimum)</em>
    <% end %><br />
    <%= f.password_field :password, autocomplete: "off" %>
  </div>

  <div class="field">
    <%= f.label :password_confirmation %><br />
    <%= f.password_field :password_confirmation, autocomplete: "off" %>
  </div>

  <div class="actions">
    <%= f.submit "Sign up" %>
  </div>
<% end %>

<%= render "devise/shared/links" %>
EOF 
cat << EOF >> ./app/controllers/user/registrations_controller.rb
class User::RegistrationsController < Devise::RegistrationsController
  protected
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end
EOF
cat << EOF >> ./config/routes.rb
Rails.application.routes.draw do
  resources :acls
  resources :tags
  resources :images
  devise_for :users
  root to: 'images#index'
end
EOF
