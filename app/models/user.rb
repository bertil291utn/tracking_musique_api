class User < ApplicationRecord
  has_secure_password
  has_many :artists, dependent: :destroy

  validates :name, length: { maximum: 35 }
  validates :email, uniqueness: true
  validates_format_of :email, with: /@/
  validates_presence_of :name, :email, :password_digest

  def artist_stats(id_string)
    artists.stats(id_string)
  end
end
