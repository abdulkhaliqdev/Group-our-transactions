class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(name: params[:name])

    if @user
      session[:user_id] = @user.id
      flash[:notice] = 'User was successfully SignIn.'
      redirect_to current_user
    else
      flash[:alert] = 'Unable to locat the User'
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
