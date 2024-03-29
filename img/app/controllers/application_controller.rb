class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  respond_to :html, :xml, :json
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :authenticate_user!, :except => [:index]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
   end
end
