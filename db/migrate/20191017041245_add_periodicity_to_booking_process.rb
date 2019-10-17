class AddPeriodicityToBookingProcess < ActiveRecord::Migration[5.2]
  def change
    add_column :booking_processes, :periodicity, :integer
  end
end
