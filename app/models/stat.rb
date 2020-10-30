class Stat < ApplicationRecord
  belongs_to :artist
  before_create :dayify

  validates_presence_of :hours, :artist_id, :track_name
  validates_numericality_of :hours, greater_than: 0

  def dayify
    self.day = Time.now.utc.strftime('%A').downcase
  end
end
