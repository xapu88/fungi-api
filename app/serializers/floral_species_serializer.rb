class FloralSpeciesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :latin_name, :habitats
end
