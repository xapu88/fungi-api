class CreateSubstrates < ActiveRecord::Migration[5.2]
  def change
    create_table :substrates do |t|
      t.string :name
      t.text :floral_species_ids, array: true, default: []
    end
  end
end
