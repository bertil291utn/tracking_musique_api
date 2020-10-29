class Stat < ApplicationRecord
  belongs_to :artist
  before_save :dayify

  validates_presence_of :hours, :day, :artist_id
  validates_numericality_of :hours, greater_than: 0

  def dayify
    self.day = created_at.strftime('%A').downcase
  end
end
