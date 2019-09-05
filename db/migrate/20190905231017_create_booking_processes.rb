class CreateBookingProcesses < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_processes do |t|
      t.integer :step
      t.timestamp :start_date
      t.timestamp :end_date
      t.decimal :monthly_fee

      t.timestamps
    end
  end
end
