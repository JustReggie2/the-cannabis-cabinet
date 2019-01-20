class AddColumnToCabinets < ActiveRecord::Migration[5.2]
  def change
    add_column :cabinets, :strain_id, :integer
  end
end
