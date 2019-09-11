class DocumentSerializer < ActiveModel::Serializer
    attributes :url_document
    has_one :document_type
  end
  