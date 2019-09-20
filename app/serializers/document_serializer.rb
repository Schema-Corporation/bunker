class DocumentSerializer < ActiveModel::Serializer
    attributes :id, :url_document
    has_one :document_type
  end
  