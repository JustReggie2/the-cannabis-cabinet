class Strain < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  has_many :cabinet_strains
  has_many :cabinets, through: :cabinet_strains
  has_many :users, through: :cabinets
end
