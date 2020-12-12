class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :icon, :icon_cache, user_locale_statuses_attributes:[ :user_id, :locale_id, :is_native, :is_wanted, :wanted_level ]])
  end
end
