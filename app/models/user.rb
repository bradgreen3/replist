class User < ApplicationRecord
  has_secure_password

  validates_confirmation_of :password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates_presence_of :first_name, :last_name

  has_many :pieces
  has_many :performances

  def self.search(search)
    where(
    "upper(first_name) LIKE ? OR
    upper(last_name) LIKE ? OR
    upper(email) LIKE ? OR
    upper(username) LIKE ?",
    "%#{search.upcase}%",
    "%#{search.upcase}%",
    "%#{search.upcase}%",
    "%#{search.upcase}%")
  end


end
