class CreateSpecies < ActiveRecord::Migration[5.2]
  def change
    create_table :species do |t|
      t.string :name
      t.text :description
      t.string :genus
      t.string :familia
      t.string :ordo
      t.string :subclassis
      t.string :classis
      t.string :subphylum
      t.string :phylum
      t.boolean :edible
      t.boolean :cultivated
      t.boolean :poisonous
      t.boolean :medicinal
    end
  end
end
