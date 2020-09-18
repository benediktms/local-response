# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: %i[
        first_name
        last_name
        email
        address
        password
        password_confirmation
      ]
    )
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username])

    # if params[:action] == 'update'
    #   devise_parameter_sanitizer.for(:account_update) do
    #     |u| u.permit(registration_params << :current_password)
    #   end
    # elsif params[:action] == 'create'
    #   devise_parameter_sanitizer.for(:sign_up) do
    #     |u| u.permit(registration_params)
    #   end
    # end
  end

  def default_url_options
    { host: ENV['DOMAIN'] || 'localhost:3000' }
  end
end
