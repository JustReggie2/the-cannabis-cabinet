class CabinetStrain < ActiveRecord::Base
  belongs_to :cabinet
  belongs_to :strain
end
