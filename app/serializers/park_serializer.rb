class ParkSerializer < ActiveModel::Serializer
  attributes :id, :name, :longitude, :latitude, :statecode, :animal, :kind, :description
end
