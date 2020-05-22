class CreaateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.date :destroy_by_user
      t.boolean :multiple, default: false

      t.timestamps
    end
  end
end
