class YoutubeUploadsController < ApplicationController

  before_action :check_token, only: [:new]

  def new
    @piece = Piece.find(params[:piece_id])
  end

  def create
    @piece = Piece.find(params[:piece_id])
    @token = YoutubeUser.where(user_id: current_user.id).first.token
    video = YoutubeService.new(nil, @token).upload_video(params)
    if video.failed?
      flash[:warning] = 'Oops! There was a problem and your video was not uploaded'
    else
      @piece.update_attributes!(yt_link: "https://www.youtube.com/watch?v=#{video.id}", yt_uid: video.id)
      flash[:success] = 'Your video has been uploaded!'
    end
    redirect_to user_piece_path(current_user, @piece)
  end

  private

  def check_token
    YoutubeUser.find_by(user_id: current_user).refresh_token_if_expired
  end

end
