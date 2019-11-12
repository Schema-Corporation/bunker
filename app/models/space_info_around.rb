class SpaceInfoAround
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming
    
    attr_accessor :id, :status, :rent_price, :space_type, :description, :title, :address, :first_photo, :height, :width, :area, :services
    
    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
    
    def persisted?
      false
    end
  end