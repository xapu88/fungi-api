class Substrate < ApplicationRecord
  has_one :observation
  belongs_to :substrate_category
  has_and_belongs_to_many :floral_species, class_name: "FloralSpecies"
end
