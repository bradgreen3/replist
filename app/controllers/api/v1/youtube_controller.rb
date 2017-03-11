class Api::V1::YoutubeController < ApplicationController

  def like
    @token = YoutubeUser.where(user_id: current_user.id).first.token
    liked = YoutubeService.new(params[:ytid], @token).like_video
    if liked == true
      render json: Piece.find(params[:pieceid])
    else
      render json: "Video cannot be liked".to_json, status: 400
    end
  end

  def dislike
    @token = YoutubeUser.where(user_id: current_user.id).first.token
    disliked = YoutubeService.new(params[:ytid], @token).dislike_video
    if disliked == true
      render json: Piece.find(params[:pieceid])
    else
      render json: "Video cannot be disliked".to_json, status: 400
    end
  end

  def destroy
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
