class YoutubeService

  def initialize(id=nil, token=nil)
    @account = Yt::Account.new access_token: token
    @video = Yt::Video.new id: id, auth: account
    @id = id
    @token = token
  end

  def get_account
    Yt::Account.new access_token: token
  end

  def upload_video(params)
    account.upload_video params[:file].try(:tempfile).try(:to_path),
                         title: params[:title],
                         description: params[:description]
  end

  def get_comments
    Rails.cache.fetch(id, :expires => 60.minutes) do
      video = Yt::Video.new(id: id)
      video.comment_threads.take(10).map(&:text_display)
    end
  end

  def like_video
    video.like
  end

  def dislike_video
    video.dislike
  end

  def delete_video
    video.delete
  rescue
    false
  end

  def on_yt?
    begin
      false if video.empty?
    rescue
      false
    else
      true
    end
  end

  private

  attr_reader :account, :video, :id, :token

end
