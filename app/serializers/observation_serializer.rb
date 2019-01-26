class ObservationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :number, :description, :area, :location, :longitude, :latitude, :altitude, :quantity, :explored_surface, :sample, :external_url, :approved, :observed_at, :created_at
  belongs_to :legator, record_type: :user
  belongs_to :determinator, record_type: :user
  belongs_to :species, record_type: :species
  # belongs_to :habitat
  # belongs_to :substrate
end
