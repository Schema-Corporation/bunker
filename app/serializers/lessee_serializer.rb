class LesseeSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :doc_type, :doc_number, :phone, :email, :created_at, :updated_at
    has_one :user
end
  