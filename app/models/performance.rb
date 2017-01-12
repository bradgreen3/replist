class Performance < ApplicationRecord
  has_many :performance_pieces
  has_many :pieces, through: :performance_pieces

  belongs_to :user
  validates_presence_of :title
end
