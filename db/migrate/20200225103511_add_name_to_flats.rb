class AddNameToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :name, :string
  end
end
