class DashboardController < ApplicationController

  def show
    if params[:slug]
      render :file => "public/404", :status => 404 if User.exists?(username: params[:slug]) == false
      @user = User.find_by(username: params[:slug]) if User.exists?(username: params[:slug])
    elsif params[:user_id]
      render :file => "public/404", :stauts => 404 if User.exists?(params[:user_id]) == false
      @user = User.find(params[:user_id]) if User.exists?(params[:user_id])
    end
  end

end
