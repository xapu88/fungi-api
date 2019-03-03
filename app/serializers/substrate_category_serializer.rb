class SubstrateCategorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :floral_species_ids
end
