class ApplicationController < ActionController::Base
  # before_action :authenticate_user!, unless: :home_controller?

  # private
  #   def after_sign_in_path_for(resource)
  #     if  resource.admin?
  #       admin_dash

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role])
  end

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_dashboard_path 
    else
      root_path 
    end
  end
end
