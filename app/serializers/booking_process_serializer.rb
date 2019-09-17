class BookingProcessSerializer < ActiveModel::Serializer
    attributes :id, :step, :start_date, :end_date, :monthly_fee, :created_at, :updated_at
    has_one :lessee
    has_one :space
    has_one :document
end
  