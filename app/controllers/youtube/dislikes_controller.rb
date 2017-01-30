class Youtube::DislikesController < ApplicationController

  def create
    @token = YoutubeUser.where(user_id: current_user.id).first.token
    dislike = YoutubeService.new(params[:id], @token).dislike_video
    if dislike == true
      flash[:success] = "Disliked!"
    else
      flash[:warning] = "Oops! There was a problem"
    end
    redirect_to user_piece_path(params[:vid_owner], params[:piece])
  end

end
