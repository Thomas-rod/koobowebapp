class CreateRentingFolders < ActiveRecord::Migration[6.0]
  def change
    create_table :renting_folders do |t|
      t.references :visit, null: false, foreign_key: true
      t.references :folder, null: false, foreign_key: true
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
