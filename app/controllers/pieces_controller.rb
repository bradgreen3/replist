class PiecesController < ApplicationController
  def index
  end

  def new
    @piece = Piece.new
  end

  def create
    @piece = current_user.pieces.new(piece_params)
    if @piece.save
      flash[:success] = "#{@piece.title} successfully added"
      redirect_to pieces_path
    else
      flash[:warning] = "Please fill in all fields"
      redirect_to new_piece_path
    end
  end

  private

  def piece_params
    params.require(:piece).permit(:composer_last, :composer_first, :title)
  end

end
