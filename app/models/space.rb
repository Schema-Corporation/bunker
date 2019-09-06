class Space < ApplicationRecord
    has_one :location
    belongs_to :lessee
    has_many :photos
    has_many :space_service_details
    has_many :services, through: :space_service_detail
end
