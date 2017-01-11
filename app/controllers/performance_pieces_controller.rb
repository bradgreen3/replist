class PerformancePiecesController < ApplicationController
  def new
    @piece = Piece.new
  end

  def create
    @performance_piece = PerformancePiece.new(performance_piece_params)
    if @performance_piece.save
      flash[:success] = "Piece Added!"
    else
      flash[:warning] = "Oops! There was a problem"
    end
    redirect_to user_performance_path(current_user, params[:performance_id])
  end

  private

  def performance_piece_params
    params.require(:piece).permit(:title).merge(performance_id: params[:performance_id])
  end

end
