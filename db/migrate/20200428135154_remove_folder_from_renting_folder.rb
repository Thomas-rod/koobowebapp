class RemoveFolderFromRentingFolder < ActiveRecord::Migration[6.0]
  def change
    remove_column :renting_folders, :folder_id
  end
end
