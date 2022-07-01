class Park < ApplicationRecord
  validates :name, :longitude, :latitude, :state, :animal, :description, presence: :true
  validates :type, inclusion: { in: [true, false] }
end