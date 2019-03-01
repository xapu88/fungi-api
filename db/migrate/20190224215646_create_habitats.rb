class CreateHabitats < ActiveRecord::Migration[5.2]
  def change
    create_table :habitats do |t|
      t.integer :habitat_category_id
      t.string :note
    end

    create_table :habitat_categories do |t|
      t.string :name
      t.text :floral_species_ids, array: true, default: []
    end
  end
end
