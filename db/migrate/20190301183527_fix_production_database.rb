class FixProductionDatabase < ActiveRecord::Migration[5.2]
  def change
    drop_table :habitats

    create_table :habitats do |t|
      t.integer :habitat_category_id
      t.string :note
    end

    if table_exists?(:habitat_categories)
      drop_table :habitat_categories
    end
    
    create_table :habitat_categories do |t|
      t.string :name
      t.text :floral_species_ids, array: true, default: []
    end
  end
end
