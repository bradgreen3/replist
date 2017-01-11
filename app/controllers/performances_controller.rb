class PerformancesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @performances = @user.performances.all
  end

  def show
    @performance = Performance.find(params[:id])
    @pieces = @performance.pieces
  end

  def new
    @user = current_user
    @performance = Performance.new
  end

  def create
    @performance = Performance.new(performance_params)
    if @performance.save
      flash[:success] = "Performance Added!"
    else
      flash[:warning] = "Oops! There was a problem"
    end
    redirect_to user_performances_path(current_user)
  end

  private

  def performance_params
    params.require(:performance).permit(:title, :date).merge(user_id: current_user.id)
  end
end
