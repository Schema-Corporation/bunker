class AddHeightToBookingProcess < ActiveRecord::Migration[5.2]
  def change
    add_column :booking_processes, :height, :decimal
  end
end
