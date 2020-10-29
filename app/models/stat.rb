class Stat < ApplicationRecord
  belongs_to :artist
  before_save :dayify

  def dayify
    self.day = created_at.strftime('%A').downcase
  end
end
