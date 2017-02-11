class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      flash[:success] = 'Successfully Logged In'
      redirect_to user_dashboard_path(user)
    else
      flash[:danger] = 'Email Address and/or Password not found'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You Have Been Successfully Logged Out'
    redirect_to root_path
  end
end
