class UsersController < ApplicationController

  def index
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order('created_at DESC')
    end
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
    params.require(:user).permit(:id, :email, :password, :password_confirmation, :last_name, :first_name, :username)
  end

end
