class Cabinet < ActiveRecord::Base
  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods
  belongs_to :user
  has_many :cabinet_strains
  has_many :strains, through: :cabinet_strains

  def slug
    name.parameterize
  end

  def self.find_by_slug(slug)
    self.all.detect {|i| i.name.parameterize == slug}
  end
end
