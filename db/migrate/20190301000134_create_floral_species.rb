class CreateFloralSpecies < ActiveRecord::Migration[5.2]
  def change
    create_table :floral_species do |t|
      t.string :name
      t.string :latin_name
    end
  end
end
