require 'pry'

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, exclude: :error
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name rank admin photo])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name rank admin photo])
  end

  def after_sign_in_path_for(resource)
    root_path
  end
end
