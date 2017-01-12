class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_dashboard_path(user)
    else
      flash.now[:danger] = "Invalid account information"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
