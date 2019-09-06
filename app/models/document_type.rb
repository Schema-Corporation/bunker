class DocumentType < ApplicationRecord
    has_many :documents
    has_many :booking_processes, through: :documents
end
