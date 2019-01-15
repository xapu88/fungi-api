class ObservationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :number, :description, :area, :location, :created_at
end
