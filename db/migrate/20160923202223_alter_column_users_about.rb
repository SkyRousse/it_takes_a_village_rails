class AlterColumnUsersAbout < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :about, :text
  end
end
