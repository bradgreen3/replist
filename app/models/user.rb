class User < ApplicationRecord
  has_secure_password

  validates_confirmation_of :password
  validates :email, presence: true, uniqueness: true
  validates_presence_of :first_name, :last_name

end
