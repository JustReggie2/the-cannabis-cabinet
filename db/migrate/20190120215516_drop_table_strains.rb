class DropTableStrains < ActiveRecord::Migration[5.2]
  def change
    drop_table :strains
  end
end
