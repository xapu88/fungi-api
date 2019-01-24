class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :full_name
      t.string :description
      t.integer :role_id
    end

    change_column :observations, :number, :string
  end
end
