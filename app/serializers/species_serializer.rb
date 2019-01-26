class SpeciesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :genus, :familia, :ordo, :subclassis, :classis, :subphylum, :phylum, :edible, :cultivated, :poisonous, :medicinal
  has_many :observations
end
