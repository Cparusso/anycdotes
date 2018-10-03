class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new

  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      redirect_to @user
    else
      flash[:notice] = 'Invalid username or password'
      session[:user_id] = @user.id
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'You Have Been Successfully Logged Out'
    redirect_to login_path
  end
end
