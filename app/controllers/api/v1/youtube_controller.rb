class Api::V1::YoutubeController < ApplicationController
  before_action :check_token

  def like
    @token = YoutubeUser.find_by(user_id: current_user.id).token
    liked = YoutubeService.new(params[:ytid], @token).like_video
    if liked == true
      render json: Piece.find(params[:pieceid])
    else
      render json: "Video cannot be liked".to_json, status: 400
    end
  end

  def dislike
    @token = YoutubeUser.find_by(user_id: current_user.id).token
    disliked = YoutubeService.new(params[:ytid], @token).dislike_video
    if disliked == true
      render json: Piece.find(params[:pieceid])
    else
      render json: "Video cannot be disliked".to_json, status: 400
    end
  end

  def comments
    @comments = YoutubeComments.all(params[:ytid])
    render json: @comments
  end

  def destroy
    @token = YoutubeUser.find_by(user_id: current_user.id).token
    deleted = YoutubeService.new(params[:ytid], @token).delete_video
    if deleted == true
      Piece.find(params[:pieceid]).update_attributes(yt_link: "", yt_uid: "")
      render json: Piece.find(params[:pieceid])
    else
      render json: "Video cannot be deleted".to_json, status: 400
    end
  end

  private

  def check_token
    YoutubeUser.find_by(user_id: current_user).refresh_token_if_expired
  end

end
