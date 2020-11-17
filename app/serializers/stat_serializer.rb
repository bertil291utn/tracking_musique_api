class StatSerializer
  include FastJsonapi::ObjectSerializer
  attributes :hours, :day, :track_name, :spotify_track_id, :created_at
end
