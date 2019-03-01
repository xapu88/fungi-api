class CreateFloralSpeciesSubstrates < ActiveRecord::Migration[5.2]
  def change
    create_table :floral_species_substrates, id: false do |t|
      t.belongs_to :floral_species, index: true
      t.belongs_to :substrate, index: true
    end
  end
end
