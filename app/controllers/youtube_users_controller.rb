class YoutubeUsersController < ApplicationController

  def create
    require "pry"; binding.pry
    YoutubeUser.from_omniauth(request.env['omniauth.auth'], current_user.id)
    redirect_to user_pieces_path(current_user)
  end

end
