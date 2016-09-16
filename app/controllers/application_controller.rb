class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:street_address, :community, :email, :password, :first_name, :last_name, :dob, :sex, :remember_me) }
    divise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:street_address, :community, :email, :password, :first_name, :last_name, :dob, :sex, :remember_me, :about, :skills, :zip_code, :likes, :current_password) }
  end
end
