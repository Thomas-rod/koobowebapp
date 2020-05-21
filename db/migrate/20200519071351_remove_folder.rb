class RemoveFolder < ActiveRecord::Migration[6.0]
  def change
    drop_table :folders
  end
end
