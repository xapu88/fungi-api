class CreateSubstrates < ActiveRecord::Migration[5.2]
  def change
    create_table :substrates do |t|
      t.integer :substrate_category_id
      t.string :note
    end

    create_table :substrate_categories do |t|
      t.string :name
      t.text :floral_species_ids, array: true, default: []
    end
  end
end
