class SpaceServiceDetailSerializer < ActiveModel::Serializer
    attributes :id
    has_one :service, include_nested_associations: true
    has_one :space, include_nested_associations: true
end
  