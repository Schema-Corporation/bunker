class SpaceSerializer < ActiveModel::Serializer
    attributes :id, :status, :width, :height, :area, :created_at, :updated_at, :rent_price
    has_one :lessor, include_nested_associations: true
end
  