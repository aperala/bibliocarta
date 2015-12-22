class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    places_path
  end

  helper_method :is_curator

  def is_curator
    (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.curator?)
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)  { |u| u.permit(:username, :email, :password, :password_confirmation, :location, :remember_me, :avatar) }
    devise_parameter_sanitizer.for(:sign_in)  { |u| u.permit(:login, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :location, :password, :password_confirmation, :current_password, :avatar) }
  end

end
