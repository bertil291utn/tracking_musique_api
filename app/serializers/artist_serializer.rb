class ArtistSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id_string, :name, :photoUrl
  has_many :stats
end
