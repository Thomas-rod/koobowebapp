class AddColumnToFolders < ActiveRecord::Migration[6.0]
  def change
    add_reference :folders, :renting_folder
    add_foreign_key :folders, :renting_folders
  end
end
