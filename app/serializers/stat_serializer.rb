class StatSerializer
  include FastJsonapi::ObjectSerializer
  attributes :hours, :day
  belongs_to :artist
end
