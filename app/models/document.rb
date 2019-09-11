class Document < ApplicationRecord
    belongs_to :document_type
    accepts_nested_attributes_for :document_type, allow_destroy: true
end
