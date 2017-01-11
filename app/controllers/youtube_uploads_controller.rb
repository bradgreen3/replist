class YoutubeUploadsController < ApplicationController

  def new
    @piece = Piece.find(params[:piece_id])
  end

  def create
    @piece = Piece.find(params[:piece_id])
    @token = YoutubeUser.where(user_id: current_user.id).first.token
    video = YoutubeService.upload_video(@token, params)
    if video.failed?
      flash[:warning] = 'Oops! There was a problem and your video was not uploaded'
    else
      @piece.update_attributes(:yt_link => "https://www.youtube.com/watch?v=#{video.id}", :yt_uid => video.id)
      flash[:success] = 'Your video has been uploaded!'
    end
    redirect_to user_piece_path(current_user, @piece)
  end

end
