class AddPriceToSpaceServiceDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :space_service_details, :service_price, :decimal
  end
end
