class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.references :renting, null: false, foreign_key: true
      t.string :label

      t.timestamps
    end
  end
end
