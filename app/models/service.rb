class Service < ApplicationRecord
    has_many :space_service_detail
    has_many :spaces, through: :space_service_detail
end
