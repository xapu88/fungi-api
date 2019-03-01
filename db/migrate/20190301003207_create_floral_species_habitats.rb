class CreateFloralSpeciesHabitats < ActiveRecord::Migration[5.2]
  def change
    create_table :floral_species_habitats, id: false do |t|
      t.belongs_to :floral_species, index: true
      t.belongs_to :habitat, index: true
    end
  end
end
