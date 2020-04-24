class AddColumnToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :facebook, :boolean, default: false
  end
end
