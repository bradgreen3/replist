class YoutubeService

  def self.account(token)
    account = Yt::Account.new access_token: token
  end

  def self.upload_video(token, params)
    account = Yt::Account.new access_token: token

    account.upload_video params[:file].try(:tempfile).try(:to_path),
                         title: params[:title],
                         description: params[:description]
  end

end
