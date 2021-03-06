class Space < ApplicationRecord
    has_one :location
    belongs_to :lessor
    has_many :photos
    has_many :booking_processes
    has_many :space_service_detail
    has_many :services, through: :space_service_detail
    accepts_nested_attributes_for :lessor, allow_destroy:true
end
