class ChangeColumnNameForStrains < ActiveRecord::Migration[5.2]
  def change
    change_column :strains, :type, :category
  end
end
