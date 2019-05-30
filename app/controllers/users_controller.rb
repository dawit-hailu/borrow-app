class UsersController < ApplicationController
  def index
      @user = User.all
  end

  def new
    if current_user
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to user_uploads_path(current_user.id)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
    ActionController::Parameters.permit_all_parameters = true
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end

end
