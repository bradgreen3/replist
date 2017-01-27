class UsersController < ApplicationController

  def index
    @users = User.where(email: params[:search])
    #where columnname like
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Account for #{@user.email} created"
      redirect_to user_dashboard_path(@user)
    else
      render :new
    end
  end

  private

  def user_params
    require "pry"; binding.pry
    params.require(:user).permit(:id, :email, :password, :password_confirmation, :last_name, :first_name, :username)
  end

end
