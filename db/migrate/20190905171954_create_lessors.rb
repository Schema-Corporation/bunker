class CreateLessors < ActiveRecord::Migration[5.2]
  def change
    create_table :lessors do |t|

      t.timestamps
    end
  end
end
