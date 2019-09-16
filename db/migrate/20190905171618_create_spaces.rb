class CreateSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :spaces do |t|
      t.references :lessor, foreign_key: true

      t.integer :status
      t.decimal :width
      t.decimal :height
      t.decimal :area

      t.timestamps
    end
  end
end
