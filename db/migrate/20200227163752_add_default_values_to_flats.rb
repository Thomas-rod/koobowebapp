class AddDefaultValuesToFlats < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:flats, :balcony, from: nil, to: false)
    change_column_default(:flats, :parking, from: nil, to: false)
    change_column_default(:flats, :cellar, from: nil, to: false)
    change_column_default(:flats, :furnished, from: nil, to: false)
  end
end
