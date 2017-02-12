class Api::V1::YoutubeController < ApplicationController


  def delete
    @token = YoutubeUser.where(user_id: current_user.id).first.token
    deleted = YoutubeService.new(params[:ytid], @token).delete_video
    if deleted == true
      Piece.find(params[:pieceid]).update_attributes(yt_link: "", yt_uid: "")
      render json: Piece.find(params[:pieceid])
    else
      render json: "Video cannot be deleted".to_json, status: 400
    end
  end

end
