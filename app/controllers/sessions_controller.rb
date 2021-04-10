class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])

    if @user
      session[:user_id] = @user.id
      redirect_to current_user, notice: 'User was successfully SignIn.'
    else
      redirect_to '/login', alert: 'Unable to locat the User'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
