class Presenter

  attr_reader :user_id, :id, :current_user

  def initialize(user_id, id=nil, current_user)
    @user_id = user_id
    @id = id
    @current_user = current_user
  end

  def user
    User.find(user_id)
  end

  def piece
    Piece.find(id)
  end

  def yt_users
    YoutubeUser.all
  end

end
