class LocationSerializer < ActiveModel::Serializer
    attributes :id, :address, :latitude, :longitude, :created_at, :updated_at
    #has_one :space
end
  