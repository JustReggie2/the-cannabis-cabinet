class CabinetStrain < ActiveRecord::Base
  belongs_to :cabinets
  belongs_to :strains
end
