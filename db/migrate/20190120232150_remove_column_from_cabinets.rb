class RemoveColumnFromCabinets < ActiveRecord::Migration[5.2]
  def change
    remove_column :cabinets, :strain_id
  end
end
