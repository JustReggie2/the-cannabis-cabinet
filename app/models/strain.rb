class Strain < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  has_many :cabinet_strains
  has_many :cabinets, through: :cabinet_strains
  has_many :users, through: :cabinets

  # def slug
  #   name.parameterize
  # end
  #
  # def self.find_by_slug(slug)
  #   self.all.detect {|i| i.name.parameterize == slug}
  # end
end
