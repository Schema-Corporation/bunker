class SpaceServiceDetailSerializer < ActiveModel::Serializer
    attributes :id, :status, :start_date, :end_date, :service_price, :created_at, :updated_at
    has_one :service, include_nested_associations: true
    has_one :space, include_nested_associations: true
end
  