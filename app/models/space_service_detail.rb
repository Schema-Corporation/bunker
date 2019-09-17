class SpaceServiceDetail < ApplicationRecord
    belongs_to :space
    belongs_to :service
    accepts_nested_attributes_for :space, :service, allow_destroy:true
end
