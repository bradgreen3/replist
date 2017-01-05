class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates_confirmation_of :password
  validates_presence_of :first_name, :last_name, :password

end
