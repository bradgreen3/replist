class Youtube::LikesController < ApplicationController

  def create
    @token = YoutubeUser.where(user_id: current_user.id).first.token
    like = YoutubeService.new(params[:id], @token).like_video
    if like == true
      flash[:success] = "Liked!"
    else
      flash[:warning] = "Oops! There was a problem"
    end
    redirect_to user_piece_path(params[:vid_owner], params[:piece])
  end

end
