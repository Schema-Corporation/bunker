class Lessee < Person
    has_many :spaces
    has_many :booking_processes, through: :spaces
end
