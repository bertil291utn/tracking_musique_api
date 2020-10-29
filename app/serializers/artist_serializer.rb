class ArtistSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id_string
  belongs_to :user
end
