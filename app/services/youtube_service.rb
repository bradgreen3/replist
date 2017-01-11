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

  def self.get_comments(id)
    video = Yt::Video.new(id: id)
    video.comment_threads.take(10).map(&:text_display)
  end

  def self.like_video(id, token)
    Yt.configuration.client_id = ENV['youtube_id']
    Yt.configuration.client_secret = ENV['youtube_secret']
    account = Yt::Account.new access_token: token

    video = Yt::Video.new id: id, auth: account
    video.like
  end

  def self.dislike_video(id, token)
    Yt.configuration.client_id = ENV['youtube_id']
    Yt.configuration.client_secret = ENV['youtube_secret']
    account = Yt::Account.new access_token: token

    video = Yt::Video.new id: id, auth: account
    video.dislike
  end


end
