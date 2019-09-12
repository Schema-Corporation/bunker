class BookingProcess < ApplicationRecord
    belongs_to :space
    belongs_to :lessor
    belongs_to :document
    accepts_nested_attributes_for :space, :lessor, :document, allow_destroy:true
end