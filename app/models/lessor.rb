class Lessor < ApplicationRecord
    has_many :spaces
    has_many :booking_processes, through: :spaces
    
    belongs_to :user
    accepts_nested_attributes_for :user, allow_destroy: true 
end
