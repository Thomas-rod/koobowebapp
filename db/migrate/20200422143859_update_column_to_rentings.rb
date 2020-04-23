class UpdateColumnToRentings < ActiveRecord::Migration[6.0]
  def change
    remove_column :rentings, :user_id
    add_reference :rentings, :renting_folder
    add_foreign_key :rentings, :renting_folders
  end
end
