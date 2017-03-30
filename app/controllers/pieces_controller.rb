class PiecesController < ApplicationController
  before_action :check_yt, :only => :show

  def index
    @user = User.find(params[:user_id])
    @yt_users = YoutubeUser.all
  end

  def show
    @presenter = Presenter.new(params[:user_id], params[:id], current_user)
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
      flash[:danger] = "Invalid Attributes"
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
      flash[:danger] = "Invalid Attributes"
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
    params.require(:piece).permit(:composer_last, :composer_first, :title, :yt_link)
  end

  def check_yt
    piece = Piece.find(params[:id])
    user = YoutubeUser.find_by(user_id: params["user_id"].to_i)
    if piece.yt_uid != "" && !piece.yt_uid != nil && user != nil
      piece.update_attributes(yt_uid: "", yt_link: "") if YoutubeService.new(piece.yt_uid, user.token).on_yt? == false
    end
  end

end
