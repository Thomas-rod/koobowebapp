class RemoveDefaultValuesFromFlats < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:flats, :balcony, from: false, to: nil)
    change_column_default(:flats, :cellar, from: false, to: nil)
    change_column_default(:flats, :parking, from: false, to: nil)
    change_column_default(:flats, :furnished, from: false, to: nil)
  end
end
