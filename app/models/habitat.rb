class Habitat < ApplicationRecord
  has_one :observation
  belongs_to :habitat_category
  has_and_belongs_to_many :floral_species
end
