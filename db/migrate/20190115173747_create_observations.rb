class CreateObservations < ActiveRecord::Migration[5.2]
  def change
    create_table :observations do |t|
      t.integer :number
      t.integer :species_id
      t.integer :legator_id
      t.integer :determinator_id
      t.integer :habitat_id
      t.integer :substrate_id
      t.datetime :observed_at
      t.string :area
      t.string :location
      t.decimal :longitude
      t.decimal :latitude
      t.decimal :altitude
      t.text :description
      t.string :quantity
      t.string :explored_surface
      t.boolean :sample
      t.string :external_url
      t.boolean :approved

      t.timestamps
    end
  end
end
