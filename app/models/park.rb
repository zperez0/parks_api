class Park < ApplicationRecord
  validates :name, :longitude, :latitude, :statecode, :animal, :description, presence: :true
  validates_inclusion_of :kind, in: ['national', 'state']
end