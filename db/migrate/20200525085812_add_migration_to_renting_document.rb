class AddMigrationToRentingDocument < ActiveRecord::Migration[6.0]
  def change
    add_column :renting_documents, :kind, :string
  end
end
