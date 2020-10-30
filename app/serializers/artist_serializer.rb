class ArtistSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id_string
  has_many :stats
end
