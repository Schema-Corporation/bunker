class CreateLessees < ActiveRecord::Migration[5.2]
  def change
    create_table :lessees do |t|
      t.string :ruc
      t.string :commercial_name

      t.timestamps
    end
  end
end
