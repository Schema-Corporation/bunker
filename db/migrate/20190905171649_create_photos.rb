class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.references :space, foreign_key: true
      
      t.text :photo_url

      t.timestamps
    end
  end
end
