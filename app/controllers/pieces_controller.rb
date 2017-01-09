class PiecesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @piece = Piece.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @piece = Piece.new
  end

  def create
    @piece = current_user.pieces.new(piece_params)
    if @piece.save
      flash[:success] = "'#{@piece.title}' Successfully Added"
      redirect_to user_pieces_path(current_user)
    else
      flash[:warning] = "Please Fill In All Fields!"
      redirect_to new_user_piece_path(current_user)
    end
  end

  def edit
    @piece = Piece.find(params[:id])
    @user = current_user
  end

  def update
    @user = current_user
    @piece = Piece.find(params[:id])
    if @piece.update(piece_params)
      flash[:success] = "Updated!"
      redirect_to user_pieces_path(@user)
    else
      flash[:warning] = "Please Fill In All Fields!"
      redirect_to edit_user_piece_path(@user, @piece)
    end
  end

  def destroy
    @user = current_user
    @piece = Piece.find(params[:id])
    @piece.destroy
    flash[:success] = "Deleted!"
    redirect_to user_pieces_path(@user)
  end

  private

  def piece_params
    params.require(:piece).permit(:composer_last, :composer_first, :title)
  end

end
