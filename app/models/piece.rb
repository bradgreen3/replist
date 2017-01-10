class Piece < ApplicationRecord
  belongs_to :user

  validates_presence_of :title

  before_save :get_uid

  def get_uid
    if self.yt_link != ""
      video = Yt::Video.new url: self.yt_link
      self.yt_uid = video.id
    end
  end

  def upload_video(user, params)
    file = params[:file].try(:tempfile).try(:to_path)
    description = params[:description]
    title = params[:title]
    token = YoutubeUser.where(user_id: user.id).first.token

    account = Yt::Account.new access_token: token
    video = account.upload_video file, title: title, description: description

    self.update_attributes(:yt_link => "https://www.youtube.com/watch?v=#{video.id}", :yt_uid => video.id)

    video
  end

end
