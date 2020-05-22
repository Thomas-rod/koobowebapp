class CreateRentingDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :renting_documents do |t|
      t.references :renting, null: false, foreign_key: true
      t.references :document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
