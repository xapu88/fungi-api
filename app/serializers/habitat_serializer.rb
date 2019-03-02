class HabitatSerializer
  include FastJsonapi::ObjectSerializer
  attributes :note
  belongs_to :habitat_category
  has_many :floral_species
end
