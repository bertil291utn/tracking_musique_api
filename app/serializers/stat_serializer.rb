class StatSerializer
  include FastJsonapi::ObjectSerializer
  attributes :hours, :day, :created_at
end
