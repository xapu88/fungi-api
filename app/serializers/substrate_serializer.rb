class SubstrateSerializer
  include FastJsonapi::ObjectSerializer
  attributes :note
  belongs_to :substrate_category
  has_many :floral_species
end
