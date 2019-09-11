class DocumentType < ApplicationRecord
    has_many :documents, inverse_of: :document_type
    has_many :booking_processes, through: :documents
end
