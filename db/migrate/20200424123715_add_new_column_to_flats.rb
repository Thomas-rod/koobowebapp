class AddNewColumnToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :category, :string
  end
end
