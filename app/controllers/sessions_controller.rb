class SessionsController < ApplicationController
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to translations_path, notice: t('.logined_in')
    else
      flash.now[:danger] = t('.login_failed')
      render :new
    end
  end
  
  def destroy
    session.delete(:user_id)
    flash[:notice] = t('.logout')
    redirect_to new_session_path
  end
end
