class Strain < ActiveRecord::Base
  has_many :cabinet_strains
  has_many :cabinets, through: :cabinet_strains
end
