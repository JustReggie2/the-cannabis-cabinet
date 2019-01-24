class Cabinet < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  belongs_to :user
  has_many :cabinet_strains
  has_many :strains, through: :cabinet_strains
end
