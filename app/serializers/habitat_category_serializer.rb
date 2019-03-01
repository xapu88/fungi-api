class HabitatCategorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :floral_species_ids
end
