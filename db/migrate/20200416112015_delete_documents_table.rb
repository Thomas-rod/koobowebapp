class DeleteDocumentsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :documents
  end
end
