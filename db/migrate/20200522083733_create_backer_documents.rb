class CreateBackerDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :backer_documents do |t|
      t.references :document, null: false, foreign_key: true
      t.references :backer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
