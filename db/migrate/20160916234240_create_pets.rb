class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.integer :age
      t.string :need_help_with
      t.string :about

      t.timestamps
    end
  end
end
