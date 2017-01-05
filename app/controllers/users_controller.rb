class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Account for #{@user.email} created"
      redirect_to dashboard_path
    else
      flash.now[:error] = "Invalid attributes"
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :email, :password, :password_confirmation, :last_name, :first_name)
  end

end
