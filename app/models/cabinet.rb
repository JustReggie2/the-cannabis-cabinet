class Cabinet < ActiveRecord::Base
  belongs_to :user
  has_many :cabinet_strains
  has_many :strains, through: :cabinet_strains

end
