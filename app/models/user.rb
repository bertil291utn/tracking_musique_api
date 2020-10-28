class User < ApplicationRecord
  has_secure_password

  validates :name, length: { maximum: 35 }
  validates :email, uniqueness: true
  validates_format_of :email, with: /@/
  validates_presence_of :name, :email, :password_digest
end
