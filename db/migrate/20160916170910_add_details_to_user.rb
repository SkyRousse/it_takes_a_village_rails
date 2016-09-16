class AddDetailsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :about, :string
    add_column :users, :skills, :string
    add_column :users, :zip_code, :string
    add_column :users, :likes, :string
    add_column :users, :street_address, :string
    add_column :users, :dob, :date
    add_column :users, :sex, :string
    add_column :users, :community, :string
  end
end
