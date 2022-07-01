class Park < ApplicationRecord
  validates :name, :longitude, :latitude, :statecode, :animal, :description, presence: :true
  # validates :type, inclusion: { in: [true, false] }
end