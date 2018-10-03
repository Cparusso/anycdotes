class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new

  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to stories_path
    else
      flash[:notice] = 'Invalid username or password'
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'You Have Been Successfully Logged Out'
    redirect_to stories_path
  end
end
