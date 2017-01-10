class YoutubeService

  def self.account(token, user_id)
    account = Yt::Account.new access_token: token
  end

  def self.video(user, params)
    token = YoutubeUser.where(user_id: user.id).first.token
    account = Yt::Account.new access_token: token

    file = params[:file].try(:tempfile).try(:to_path)
    description = params[:description]
    title = params[:title]

    video = account.upload_video file, title: title, description: description
  end

end
