class RemoveColumnsToBackers < ActiveRecord::Migration[6.0]
  def change
    remove_column :backers, :revenue
    remove_column :backers, :phone_number
  end
end
