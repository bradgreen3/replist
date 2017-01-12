class YoutubeDeletesController < ApplicationController

  def create
    @token = YoutubeUser.where(user_id: current_user.id).first.token
    deleted = YoutubeService.new(params[:yt_id], @token).delete_video
    if deleted == true
      Piece.find(params[:piece_id]).update_attributes(yt_link: "", yt_uid: "")
      flash[:success] = "Deleted!"
    else
      flash[:warning] = "Oops! There was a problem"
    end
    redirect_to user_piece_path(current_user, params[:piece_id])
  end

end
