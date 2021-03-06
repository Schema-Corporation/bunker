class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.references :space, foreign_key: true

      t.string :address
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
