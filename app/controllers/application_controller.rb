class ApplicationController < ActionController::Base
 protect_from_forgery prepend: true, with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_user_can_edit?
  helper_method :own_event?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
        :account_update,
        keys: [:password, :password_confirmation, :current_password]
    )
  end

  def current_user_can_edit?(model)
    user_signed_in? && (
    model.user == current_user ||
        (model.try(:event).present? && model.event.user == current_user)
    )
  end

  def own_event?(event)
    event.user == current_user
  end
end
