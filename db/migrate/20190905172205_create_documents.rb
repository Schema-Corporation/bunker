class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.references :document_type, foreign_key: true

      t.text :url_document

      t.timestamps
    end
  end
end
