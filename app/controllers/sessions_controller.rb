class SessionsController < ApplicationController
  def new
  end

  def create
    # find by downcase email because of validation
    user = User.find_by_email(params[:email].downcase)
    log_in user
    redirect_back_or user
  end

  def destroy
    log_out if logged_in?
    redirect_to '/'
  end
end