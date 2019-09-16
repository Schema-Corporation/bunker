class CreateLessors < ActiveRecord::Migration[5.2]
  def change
    create_table :lessors do |t|
      t.references :user, foreign_key: true
      
      t.string :ruc
      t.string :commercial_name

      t.string :first_name
      t.string :last_name
      t.integer :doc_type
      t.string :doc_number
      t.string :phone
      t.text :email

      t.timestamps
    end
  end
end
