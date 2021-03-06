class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:notice] = "Welcome to the app #{@user.name}!"
      redirect_to current_user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
