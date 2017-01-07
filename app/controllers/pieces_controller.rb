class PiecesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @piece = Piece.new
  end

  def create
    @piece = current_user.pieces.new(piece_params)
    if @piece.save
      flash[:success] = "#{@piece.title} successfully added"
      redirect_to user_pieces_path(current_user)
    else
      flash[:warning] = "Please fill in all fields"
      redirect_to new_user_piece_path(current_user)
    end
  end

  private

  def piece_params
    params.require(:piece).permit(:composer_last, :composer_first, :title)
  end

end
