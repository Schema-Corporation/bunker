class Document < ApplicationRecord
    belongs_to :document_type, inverse_of: :documents
    accepts_nested_attributes_for :document_type, allow_destroy: true
end
