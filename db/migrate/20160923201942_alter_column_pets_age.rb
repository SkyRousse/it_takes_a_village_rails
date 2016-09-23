class AlterColumnPetsAge < ActiveRecord::Migration[5.0]
  def change
    change_column :pets, :age, :string
  end
end
