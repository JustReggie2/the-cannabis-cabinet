class DropTableCreateCabinetsStrains < ActiveRecord::Migration[5.2]
  def change
    drop_table :cabinets_strains
  end
end
