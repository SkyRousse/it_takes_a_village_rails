class RenameNeedHelpWithToPetCategoryId < ActiveRecord::Migration[5.0]
  def change
    rename_column :pets, :need_help_with, :pet_category_id
  end
end
