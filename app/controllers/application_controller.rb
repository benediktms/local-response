class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def configure_devise_permitted_parameters
    registration_params = [:first_name, :last_name, :photo, :address, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) do
        |u| u.permit(registration_params << :current_password)
      end
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) do
        |u| u.permit(registration_params)
      end
    end
  end
end
