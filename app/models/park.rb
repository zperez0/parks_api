class Park < ApplicationRecord

  validates :name, :longitude, :latitude, :statecode, :animal, :description, presence: :true
  validates_inclusion_of :kind, in: ["national", "state"]
  before_save :titleize_park_name

  default_scope { order(name: :asc) }

  private

  def titleize_park_name
    self.name = self.name.titleize
  end
end
