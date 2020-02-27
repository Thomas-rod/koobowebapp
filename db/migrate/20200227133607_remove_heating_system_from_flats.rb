class RemoveHeatingSystemFromFlats < ActiveRecord::Migration[6.0]
  def change
    remove_column :flats, :heating_system
  end
end
