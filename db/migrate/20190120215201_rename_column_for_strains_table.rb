class RenameColumnForStrainsTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :strains, :type, :Category
  end
end
