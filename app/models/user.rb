class User < ApplicationRecord
  has_secure_password

  validates_confirmation_of :password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates_presence_of :first_name, :last_name

  has_many :pieces

end
