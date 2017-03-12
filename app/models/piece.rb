require 'uri'

class Piece < ApplicationRecord
  has_many :performance_pieces
  has_many :performances, through: :performance_pieces

  belongs_to :user

  validates_presence_of :title

  before_save :get_uid

  validates_format_of :yt_link, :with => URI::regexp(%w(http https)), :allow_blank => true

  def get_uid
    if self.yt_link != ""
      query_string = URI.parse(self.yt_link).query
      parameters = Hash[URI.decode_www_form(query_string)]
      self.yt_uid = parameters['v']
    end
  end

end
