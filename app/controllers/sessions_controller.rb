class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    log_in user
    redirect_back_or user
  end

  def destroy
    log_out if logged_in?
    redirect_to '/'
  end

  def session_params
    params.require(:session).permit(:email)
  end
end