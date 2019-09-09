class AddPriceToSpace < ActiveRecord::Migration[5.2]
  def change
    add_column :spaces, :rent_price, :decimal
  end
end
