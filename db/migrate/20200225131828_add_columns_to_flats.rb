class AddColumnsToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :number_of_rooms, :integer
    add_column :flats, :number_of_bedrooms, :integer
    add_column :flats, :surface, :float
    add_column :flats, :floor, :integer
    add_column :flats, :elevator, :boolean
    add_column :flats, :balcony, :boolean
    add_column :flats, :cellar, :boolean
    add_column :flats, :parking, :boolean
    add_column :flats, :heating_system, :string
    add_column :flats, :furnished, :boolean
    change_column_default(:flats, :visible, from: nil, to: true)
    change_column_default(:flats, :rented, from: nil, to: false)
  end
end
