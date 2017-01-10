class YoutubeUsersController < ApplicationController

  def create
    token = request.env['omniauth.auth']['credentials']['token']
    YoutubeUser.create(token: token, user_id: current_user.id)
    redirect_to user_pieces_path(current_user)
  end

end
