class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
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
