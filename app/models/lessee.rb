class Lessee < ApplicationRecord
    has_many :spaces
    has_many :booking_processes, through: :spaces

    belongs_to :user
end
