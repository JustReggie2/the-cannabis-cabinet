class RemoveColumnFromStrains < ActiveRecord::Migration[5.2]
  def change
    remove_column :strains, :strain_id
  end
end
