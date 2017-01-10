class YoutubeUploadsController < ApplicationController

  def new
    @piece = Piece.find(params[:piece_id])
  end

  def create
    @piece = Piece.find(params[:piece_id])
    uploaded_video = @piece.upload_video(current_user, params)
    if uploaded_video.failed?
      flash[:warning] = 'Oops! There was a problem and your video was not uploaded'
    else
      flash[:success] = 'Your video has been uploaded!'
    end
    redirect_to user_piece_path(current_user, @piece)
  end

end
