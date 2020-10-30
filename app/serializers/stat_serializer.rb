class StatSerializer
  include FastJsonapi::ObjectSerializer
  attributes :hours, :day
end
