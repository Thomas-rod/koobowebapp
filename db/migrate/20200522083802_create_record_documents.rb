class CreateRecordDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :record_documents do |t|
      t.references :document, null: false, foreign_key: true
      t.references :record, null: false, foreign_key: true

      t.timestamps
    end
  end
end
