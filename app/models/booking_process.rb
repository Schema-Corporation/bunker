class BookingProcess < ApplicationRecord
    belongs_to :space
    belongs_to :lessee
    belongs_to :document
    accepts_nested_attributes_for :space, :lessee, :document, allow_destroy:true
end