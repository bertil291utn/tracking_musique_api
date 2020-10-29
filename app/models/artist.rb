class Artist < ApplicationRecord
  belongs_to :user
  validates_length_of :id_string, maximum: 22
  validates_format_of :id_string, with: /[A-Za-z0-9]+/
end
