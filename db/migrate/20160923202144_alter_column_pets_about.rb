class AlterColumnPetsAbout < ActiveRecord::Migration[5.0]
  def change
    change_column :pets, :about, :text
  end
end
