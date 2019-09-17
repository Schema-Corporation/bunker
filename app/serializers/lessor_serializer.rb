class LessorSerializer < ActiveModel::Serializer
    attributes :id, :ruc, :commercial_name, :first_name, :last_name, :doc_type, :doc_number, :phone, :email, :created_at, :updated_at
    has_one :user
end
  