class AddNewColumnsToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :pap, :boolean, default: false
    add_column :flats, :leboncoin, :boolean, default: false
    add_column :flats, :seloger, :boolean, default: false
    add_column :flats, :bienici, :boolean, default: false
  end
end
