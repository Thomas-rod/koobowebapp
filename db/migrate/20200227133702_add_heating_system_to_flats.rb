class AddHeatingSystemToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :heating_system, :string, array: true, default: []
  end
end
