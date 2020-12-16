class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def authenticate_user
    unless logged_in?
      flash[:notice] = t('.login_request')
      redirect_to new_session_path
    end
  end

  def admin_user
    unless current_user.admin
      flash[:notice] = t('.admin_only')
      redirect_to books_path
    end
  end
end
