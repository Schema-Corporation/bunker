class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :photo_url, :created_at, :updated_at
  has_one :space
end
