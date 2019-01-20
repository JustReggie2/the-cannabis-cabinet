class User < ActiveRecord::Base
  has_many :cabinets
  has_many :strains, through: :cabinets
end
