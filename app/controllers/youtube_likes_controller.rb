class YoutubeLikesController < ApplicationController

  def create
    @token = YoutubeUser.where(user_id: current_user.id).first.token
    like = YoutubeService.like_video(params[:id], @token)
    if like == true
      flash[:success] = "Liked!"
    else
      flash[:warning] = "Oops! There was a problem"
    end
    redirect_to user_piece_path(params[:vid_owner], params[:piece])
  end

end
