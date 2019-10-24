class AddWidthToBookingProcess < ActiveRecord::Migration[5.2]
  def change
    add_column :booking_processes, :width, :decimal
  end
end
