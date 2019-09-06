class CreateSpaceServiceDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :space_service_details do |t|
      t.references :space, foreign_key: true
      t.references :service, foreign_key: true

      t.integer :status
      t.timestamp :start_date
      t.timestamp :end_date

      t.timestamps
    end
  end
end
