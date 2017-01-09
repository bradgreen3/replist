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

end
