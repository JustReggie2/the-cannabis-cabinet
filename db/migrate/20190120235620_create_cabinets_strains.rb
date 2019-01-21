class CreateCabinetsStrains < ActiveRecord::Migration[5.2]
  def change
    create_table :cabinets_strains do |t|
      t.integer :cabinet_id
      t.integer :strain_id
    end
  end
end
