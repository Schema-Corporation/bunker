class BookingProcess < ApplicationRecord
    belongs_to :space
    belongs_to :lessor
    belongs_to :document
end